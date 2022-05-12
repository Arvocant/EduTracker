import 'package:flutter/material.dart';

class StudentList extends StatefulWidget {
  const StudentList({Key key}) : super(key: key);

  @override
  State<StudentList> createState() => _StudentListState();
}

class _StudentListState extends State<StudentList> {
  final List<String> studentlist = <String>['Arvo', 'Thibault', 'Filip'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: studentlist.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                height: 50,
                margin: EdgeInsets.all(2),
                color: Colors.amber,
                child: Center(
                  child: Text('${studentlist[index]}'),
                ));
          }),
    );
  }
}
