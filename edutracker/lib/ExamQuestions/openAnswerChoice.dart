import 'package:flutter/material.dart';

class openAnswerChoice extends StatefulWidget {
  openAnswerChoice({Key key}) : super(key: key);

  @override
  State<openAnswerChoice> createState() => _openAnswerChoiceState();
}

class _openAnswerChoiceState extends State<openAnswerChoice> {
  bool endQuiz = false;
  int _questionList = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Open Choice Exam',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 100.0,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(color: Colors.red[900]),
              child: Center(
                child: Text(
                  _openQuestions[_questionList]['questionText'],
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  // onChanged: (value) {
                  //   if (_openQuestions[_questionList]['answer'] == value) {}
                  // },
                ),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40)),
                onPressed: () {},
                child: Text(endQuiz ? 'Beeindigen' : 'Volgende vraag'))
          ],
        ),
      ),
    );
  }
}

final _openQuestions = [
  {
    'questionText': 'Q1. How long is New Zealand’s Ninety Mile Beach?',
    'answer': '88km',
  },
];
