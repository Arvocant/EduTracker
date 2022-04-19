import 'package:flutter/material.dart';

class multipleChoice extends StatefulWidget {
  @override
  State<multipleChoice> createState() => _multipleChoiceState();
}

class _multipleChoiceState extends State<multipleChoice> {
  List<Icon> _scoreTracker;

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
                children: const [
                  Icon(Icons.check_circle, color: Colors.green),
                  Icon(Icons.clear, color: Colors.red)
                ],
              ),
              Container(
                width: double.infinity,
                height: 130.0,
                margin: const EdgeInsets.only(bottom: 10, left: 30, right: 30),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                decoration: BoxDecoration(color: Colors.red[900]),
                child: const Center(
                  child: Text('De vragen komen hier terecht',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  decoration: BoxDecoration(
                    color: null,
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Text(
                    'Geef hier uw antwoord in',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  decoration: BoxDecoration(
                    color: null,
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Text(
                    'Geef hier uw antwoord in',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                  decoration: BoxDecoration(
                    color: null,
                    border: Border.all(color: Colors.red),
                  ),
                  child: const Text(
                    'Geef hier uw antwoord in',
                    style: TextStyle(fontSize: 15.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 40)),
                onPressed: () {},
                child: const Text('Volgende vraag'),
              ),
              //Score weergeven
              Container(
                padding: EdgeInsets.all(20),
                child: const Text(
                  '0/9',
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
