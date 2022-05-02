import 'package:edutracker/ExamQuestions/answer.dart';
import 'package:flutter/material.dart';

class multipleChoice extends StatefulWidget {
  @override
  State<multipleChoice> createState() => _multipleChoiceState();
}

class _multipleChoiceState extends State<multipleChoice> {
  List<Icon> _scoreTracker = [];
  int _questionList = 0;
  int _totalscore = 0;
  bool answerSelected = false;
  bool endQuiz = false;
  bool correctAswerSelected = false;

  void _questionAnswer(bool answerScore) {
    setState(() {
      //Antwoord is gekozen
      answerSelected = true;
      //Kijk of het antwoord juist is
      if (answerScore) {
        _totalscore++;
        correctAswerSelected = true;
      }
      //Voeg de score tracker toe (optioneel)
      _scoreTracker.add(
        answerScore
            ? Icon(Icons.check_circle, color: Colors.green)
            : Icon(Icons.clear, color: Colors.red),
      );
      //Als alle vragen zijn geweest
      if (_questionList + 1 == _questions.length) {
        endQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionList++;
      answerSelected = false;
      correctAswerSelected = false;
    });
    //Einde van de quiz
    if (_questionList >= _questions.length) {
      _goBack();
    }
  }

  void _goBack() {
    setState(() {
      _questionList = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Multiple Choice Exam',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              //Icons voor juist of fout
              Row(
                children: [
                  if (_scoreTracker.length == 0)
                    const SizedBox(
                      height: 25,
                    ),
                  if (_scoreTracker.length > 0) ..._scoreTracker
                ],
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                decoration: BoxDecoration(color: Colors.red[900]),
                child: Center(
                  child: Text(
                    //_questions[_questionList]
                    'question', //'De vragen komen hier terecht'
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              ...(_questions[_questionList]['answers']
                      as List<Map<String, dynamic>>)
                  .map(
                (answer) => Answer(
                  answerText: answer['answerText'],
                  answerColor: answerSelected
                      ? answer['score']
                          ? Colors.green
                          : Colors.red
                      : Colors.white,
                  answerTap: () {
                    //Als het antwoord al geselecteerd was gebeurd er niets op onTap
                    if (answerSelected) return;
                    //Antwoord wordt geselecteerd
                    _questionAnswer(answer['score']);
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40)),
                onPressed: () {
                  if (!answerSelected) return;
                  _nextQuestion();
                },
                child: Text(endQuiz ? 'Beeindigen' : 'Volgende vraag'),
              ),
              //Score weergeven
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  '${_totalscore.toString()}/${_questions.length}',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}

// ignore: prefer_const_declarations
final _questions = const [
  {
    'question': 'How long is New Zealand’s Ninety Mile Beach?',
    'answers': [
      {'answerText': '88km, so 55 miles long.', 'score': true},
      {'answerText': '55km, so 34 miles long.', 'score': false},
      {'answerText': '90km, so 56 miles long.', 'score': false},
    ],
  },
  {
    'question':
        'In which month does the German festival of Oktoberfest mostly take place?',
    'answers': [
      {'answerText': 'January', 'score': false},
      {'answerText': 'October', 'score': false},
      {'answerText': 'September', 'score': true},
    ],
  },
  {
    'question': 'Who composed the music for Sonic the Hedgehog 3?',
    'answers': [
      {'answerText': 'Britney Spears', 'score': false},
      {'answerText': 'Timbaland', 'score': false},
      {'answerText': 'Michael Jackson', 'score': true},
    ],
  },
  {
    'question': 'In Georgia (the state), it’s illegal to eat what with a fork?',
    'answers': [
      {'answerText': 'Hamburgers', 'score': false},
      {'answerText': 'Fried chicken', 'score': true},
      {'answerText': 'Pizza', 'score': false},
    ],
  },
  {
    'question':
        'Which part of his body did musician Gene Simmons from Kiss insure for one million dollars?',
    'answers': [
      {'answerText': 'His tongue', 'score': true},
      {'answerText': 'His leg', 'score': false},
      {'answerText': 'His butt', 'score': false},
    ],
  },
  {
    'question': 'In which country are Panama hats made?',
    'answers': [
      {'answerText': 'Ecuador', 'score': true},
      {'answerText': 'Panama (duh)', 'score': false},
      {'answerText': 'Portugal', 'score': false},
    ],
  },
  {
    'question': 'From which country do French fries originate?',
    'answers': [
      {'answerText': 'Belgium', 'score': true},
      {'answerText': 'France (duh)', 'score': false},
      {'answerText': 'Switzerland', 'score': false},
    ],
  },
  {
    'question': 'Which sea creature has three hearts?',
    'answers': [
      {'answerText': 'Great White Sharks', 'score': false},
      {'answerText': 'Killer Whales', 'score': false},
      {'answerText': 'The Octopus', 'score': true},
    ],
  },
  {
    'question': 'Which European country eats the most chocolate per capita?',
    'answers': [
      {'answerText': 'Belgium', 'score': false},
      {'answerText': 'The Netherlands', 'score': false},
      {'answerText': 'Switzerland', 'score': true},
    ],
  },
];
