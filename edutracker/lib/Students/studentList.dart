import 'package:edutracker/ExamQuestions/multipleChoice.dart';
import 'package:edutracker/StudentExam/ChoiceTypeExam.dart';
import 'package:edutracker/Students/personas.dart';
import 'package:flutter/material.dart';

import 'AddStudent.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  List<Personas> persons = [];

  TextEditingController idController = TextEditingController();
  TextEditingController naamController = TextEditingController();
  TextEditingController sNummerController = TextEditingController();

  // List<String> studentlist = <String>[
  //   'Arvo',
  //   'Thibault',
  //   'Filip',
  //   'Siebe',
  //   'Niels'
  // ];

  @override
  Widget build(BuildContext context) {
    void addStudents(Personas person) {
      setState(() {
        persons.add(person);
      });
    }

    void showUserDialog() {
      showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            content: AddStudentDialog(addStudents),
          );
        },
      );
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: showUserDialog,
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text(
          'Student List',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: 800,
        //padding: EdgeInsets.all(10),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(4),
              elevation: 8,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChoiceTypeExam()),
                  );
                },
                // We willen aparte vakjes hebben zoals bij android listView
                title: Text(persons[index].name),
                subtitle: Text(persons[index].studentId),
                trailing: ElevatedButton(
                  child: Icon(Icons.clear),
                  onPressed: () {
                    //delete action voor de knop
                    persons.removeWhere((element) {
                      return element.id == persons[index].id;
                    });
                    setState(() {
                      //refresh UI na het verwijderen uit de lijst
                    });
                  },
                ),
              ),
            );
          },
          itemCount: persons.length,
        ),
      ),
    );
  }
}
