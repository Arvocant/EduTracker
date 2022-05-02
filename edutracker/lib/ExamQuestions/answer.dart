import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answerText;
  final Color answerColor;
  final Function answerTap;

  Answer(
      {Key? key,
      required this.answerText,
      required this.answerColor,
      required this.answerTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      //onTap: answerTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        decoration: BoxDecoration(
          color: null,
          border: Border.all(color: Colors.red),
        ),
        child: const Text(
          'Geef hier uw antwoord in',
          style: TextStyle(fontSize: 15.0),
        ),
      ),
    );
  }
}
