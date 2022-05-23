import 'package:edutracker/ExamQuestions/correctTheCode.dart';
import 'package:edutracker/ExamQuestions/multipleChoice.dart';
import 'package:edutracker/ExamQuestions/openAnswerChoice.dart';
import 'package:flutter/material.dart';

import '../AddQuestions/AddCorrectCodeQuestion.dart';
import '../AddQuestions/AddMultipleChoice.dart';
import '../AddQuestions/AddOpenQuestion.dart';

class ChoiceTypeExam extends StatefulWidget {
  ChoiceTypeExam({Key key, String text}) : super(key: key);

  @override
  State<ChoiceTypeExam> createState() => _ChoiceTypeExamState();
}

class _ChoiceTypeExamState extends State<ChoiceTypeExam> {
  String text = "De te beantwoorden vragen: \n";

  TextEditingController inputController = TextEditingController();

  void _awaitReturnValueFromMultipleChoice(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddMultipleChoice(),
        ));

    setState(() {
      text += "+ ${result}\n";
    });
  }

  void _awaitReturnValueFromOpenQ(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddOpenQuestion(),
        ));

    setState(() {
      text += "- ${result}\n";
    });
  }

  void _awaitReturnValueFromCorrectCode(BuildContext context) async {
    final result = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => AddCorrectCodeQuestion(),
        ));

    setState(() {
      text += "~ ${result}\n";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Add Questions',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(40),
              child: Text(
                text ?? "Hier komen de vragen", //Hier komt de dynamische tekst
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
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
                          primary: Colors.black,
                          onPrimary: Colors.white,
                          minimumSize: Size(200, 70),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => multipleChoice()),
                          );
                        },
                        icon: Icon(Icons.playlist_add_outlined),
                        label: Text("Multiple Choice"),
                      ),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        minimumSize: Size(200, 70),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => openAnswerChoice()),
                        );
                      },
                      icon: Icon(Icons.playlist_add_outlined),
                      label: Text("Open Vraag"),
                    ),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black,
                        onPrimary: Colors.white,
                        minimumSize: Size(200, 70),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => correctTheCode()),
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
