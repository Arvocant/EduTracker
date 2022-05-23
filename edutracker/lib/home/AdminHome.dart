// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:edutracker/AddQuestions/AddQuestions.dart';
import 'package:edutracker/Students/studentList.dart';
import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  AdminHome({Key key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Home"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                minimumSize: Size(300, 200),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddQuestions()),
                );
              },
              child: Text("Examens"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                minimumSize: Size(300, 200),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => StudentList()),
                );
              },
              child: Text("Students"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                onPrimary: Colors.white,
                minimumSize: Size(300, 200),
              ),
              onPressed: null,
              child: Text("Wachtwoord wijzigen"),
            ),
          ],
        ),
      ),
    );
  }
}
