// ignore_for_file: prefer_const_constructors

import 'package:edutracker/AddQuestions/AddMultipleChoice.dart';
import 'package:edutracker/AddQuestions/AddOpenQuestion.dart';
import 'package:edutracker/AddQuestions/AddCorrectCodeQuestion.dart';
import 'package:flutter/material.dart';

class AddQuestions extends StatefulWidget {
  AddQuestions({Key key}) : super(key: key);

  @override
  State<AddQuestions> createState() => _AddQuestionsState();
}

class _AddQuestionsState extends State<AddQuestions> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add Questions',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                "Hier komen de vragen",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.indigo,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                      child: ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.indigo,
                          onPrimary: Colors.white,
                          minimumSize: Size(200, 70),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddMultipleChoice()),
                          );
                        },
                        icon: Icon(Icons.playlist_add_outlined),
                        label: Text("Multiple Choice"),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                        minimumSize: Size(200, 70),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddOpenQuestion()),
                        );
                      },
                      icon: Icon(Icons.playlist_add_outlined),
                      label: Text("Open Vraag"),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                        minimumSize: Size(200, 70),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddCorrectCodeQuestion()),
                        );
                      },
                      icon: Icon(Icons.playlist_add_outlined),
                      label: Text("Correcte Code Vragen"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
