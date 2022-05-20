import 'package:flutter/material.dart';

class correctTheCode extends StatefulWidget {
  correctTheCode({Key key}) : super(key: key);

  @override
  State<correctTheCode> createState() => _correctTheCodeState();
}

class _correctTheCodeState extends State<correctTheCode> {
  TextEditingController inputController = TextEditingController();

  int _questionList = 0;
  int _totalscore = 0;
  bool correctAswerSelected = false;

  bool endQuiz = false;

  void _questionRight(bool answerScore) {
    setState(() {
      if (answerScore) {
        _totalscore++;
        correctAswerSelected = true;
      }
      if (_questionList + 1 == _code.length) {
        endQuiz = true;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      _questionList++;
      correctAswerSelected = false;
    });
    //Einde van de quiz
    if (_questionList >= _code.length) {
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Correct The Code',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 100.0,
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                decoration: BoxDecoration(color: Colors.red[900]),
                child: Center(
                  child: Text(
                    _code[_questionList]['codeText'],
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                child: Center(
                  child: TextField(
                    controller: inputController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (value) {
                      setState(() {
                        inputController.text = value.toString();
                      });
                      if (_code[_questionList]['answer'] == value) {
                        _questionRight(true);
                      } else {
                        _questionRight(false);
                      }
                    },
                  ),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40)),
                onPressed: () {
                  _nextQuestion();
                },
                child: Text(endQuiz ? 'Beeindigen' : 'Volgende vraag'),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: Text(
                  '${_totalscore.toString()}/${_code.length}',
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final _code = [
  {
    'codeText': 'print(hello world)',
    'answer': 'print("hello world");',
    'score': false
  },
];
