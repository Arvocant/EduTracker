// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class ExamChoices extends StatefulWidget {
  ExamChoices({Key key}) : super(key: key);

  @override
  State<ExamChoices> createState() => _ExamChoicesState();
}

class _ExamChoicesState extends State<ExamChoices> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Exam Choices"),
      ),
      body: Center(
        child: Row(
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                onPrimary: Colors.white,
                minimumSize: Size(60, 40),
              ),
              onPressed: null,
              child: Text("Student"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
                onPrimary: Colors.white,
                minimumSize: Size(60, 40),
              ),
              onPressed: null,
              child: Text("Admin"),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.grey,
                onPrimary: Colors.white,
                minimumSize: Size(60, 40),
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
