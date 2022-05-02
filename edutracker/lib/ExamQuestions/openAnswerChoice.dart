import 'package:flutter/material.dart';

class openAnswerChoice extends StatefulWidget {
  openAnswerChoice({Key? key}) : super(key: key);

  @override
  State<openAnswerChoice> createState() => _openAnswerChoiceState();
}

class _openAnswerChoiceState extends State<openAnswerChoice> {
  bool endQuiz = false;

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
              height: 130.0,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              decoration: BoxDecoration(color: Colors.red[900]),
              child: const Center(
                child: Text(
                  "Hier komt de vraag",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: const Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
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
