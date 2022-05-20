import 'package:edutracker/ExamQuestions/multipleChoice.dart';
import 'package:edutracker/StudentExam/ChoiceTypeExam.dart';
import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Person> persons = [];

  @override
  void initState() {
    //adding item to list, you can add using json from network
    persons.add(Person(id: "1", name: "Arvo", studentId: "s112233"));
    persons.add(Person(id: "2", name: "Thibault", studentId: "s112233"));
    persons.add(Person(id: "3", name: "Siebe", studentId: "s112233"));
    persons.add(Person(id: "4", name: "Niels", studentId: "s112233"));

    super.initState();
  }

  // List<String> studentlist = <String>[
  //   'Arvo',
  //   'Thibault',
  //   'Filip',
  //   'Siebe',
  //   'Niels'
  // ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Student List',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              children: persons.map((personas) {
                return Container(
                  child: Card(
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ChoiceTypeExam()),
                        );
                      },
                      // We willen aparte vakjes hebben zoals bij android listView
                      title: Text(personas.name),
                      subtitle: Text(personas.studentId),
                      trailing: ElevatedButton(
                        child: Icon(Icons.clear),
                        onPressed: () {
                          //delete action voor de knop
                          persons.removeWhere((element) {
                            return element.id == personas.id;
                          });
                          setState(() {
                            //refresh UI na het verwijderen uit de lijst
                          });
                        },
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ));
  }
}

class Person {
  //modal class for Person object
  String id, name, studentId;
  Person({this.id, this.name, this.studentId});
}
