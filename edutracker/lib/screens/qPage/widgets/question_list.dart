import 'package:edutracker/AddQuestions/AddQuestions.dart';
import 'package:flutter/material.dart';
import 'package:edutracker/models/question.dart';

class QuestionList extends StatefulWidget {
  final List<Question> questionItems;
  final void Function(Question) onClicked;


  QuestionList({this.questionItems, this.onClicked});


  @override
  _QuestionListState createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0.0),
        itemCount: widget.questionItems.length,
        itemBuilder: (context, item) {
          return _buildRow(
              context, widget.questionItems[item], widget.onClicked);
        });
  }
}

Widget _buildRow(
    BuildContext context, Question question, Function(Question) onClicked) {
  return Container(
    decoration: BoxDecoration(
        color: Color.fromRGBO(0, 0, 0, 0.04),
        borderRadius: BorderRadius.circular(8.0)),
    margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
    child: ListTile(
        // leading: Padding(child: Text(question.title)),
        title:
            Text(question.title, style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(question.type.name),
        onTap: pushToQuestion(context, question)),
  );
}

pushToQuestion(BuildContext context, Question question) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AddQuestions() //EEN PAGE met question in
          ));
}
