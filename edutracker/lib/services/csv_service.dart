import 'dart:convert';
import 'dart:html';

import 'package:csv/csv.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:html' as html;
import 'package:edutracker/models/person.dart';

class CsvService {
  void generateCSV() {    //init DB
    List<String> rowHeader = Person.fields;

    List<List<dynamic>> rows = [];

    rows.add(rowHeader);

    for (var i = 0; i < 5; i++) { //adding dummy data
      List<dynamic> dataRow = [];
      dataRow.add("PID :$i");
      dataRow.add("FIRSTNAME :$i");
      dataRow.add("LASTNAME :$i");
      
      rows.add(dataRow);
    }

    String csv = const ListToCsvConverter().convert(rows);  //use csv plugin to make string array into csv data 

    final bytes = utf8.encode(csv); //csv data to utf8 encoding (universal characters)

    final blob = html.Blob([bytes]); //creating html package
    final url = html.Url.createObjectUrlFromBlob(blob); //creating downloadable obj

    final anchor = html.document.createElement('a') as html.AnchorElement..href = url..style.display = 'none' .. download = 'crntstdnts.csv'; //creating anchor to download csv file
    html.document.body?.children.add(anchor); //add csv anchor to a body

    anchor.click(); //download file
    html.Url.revokeObjectUrl(url);
  }

  Future<Person> getPersonById(String pid) async {
    const nullPerson = null;
    try {
      FilePickerResult? csvFile = await FilePicker.platform.pickFiles(
        allowedExtensions: ['csv'],
        type: FileType.custom,
        allowMultiple: false
      );
      if (csvFile != null) {
        final bytes2 = utf8.decode(List.from(csvFile));
        List<List<dynamic>> rowsAsListOfValues  = const  CsvToListConverter().convert(csvFile);
        for (var i = 0; i < rowsAsListOfValues.length; i++) {
          if (rowsAsListOfValues.elementAt(i).elementAt(0) == pid) {
            return Person(pid, "studentId", DateTime.now(), rowsAsListOfValues.elementAt(i).elementAt(1), rowsAsListOfValues.elementAt(i).elementAt(2), Role.student);
          }
        }
      }
      print("Got ");
      

    } on Exception catch (e) {
      print(e);
    }
  return nullPerson;
  }
}