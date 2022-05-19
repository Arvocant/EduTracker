// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

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
