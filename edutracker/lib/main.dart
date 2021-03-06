// ignore_for_file: prefer_const_constructors, unused_import

import 'package:edutracker/AddQuestions/AddCorrectCodeQuestion.dart';
import 'package:edutracker/AddQuestions/AddMultipleChoice.dart';
import 'package:edutracker/AddQuestions/AddOpenQuestion.dart';
import 'package:edutracker/AddQuestions/AddQuestions.dart';
import 'package:edutracker/ExamQuestions/correctTheCode.dart';
import 'package:edutracker/ExamQuestions/multipleChoice.dart';
import 'package:edutracker/ExamQuestions/openAnswerChoice.dart';
import 'package:edutracker/LoginSignupScreen/login_final.dart';
import 'package:edutracker/LoginSignupScreen/signup.dart';
import 'package:edutracker/Maps/MapApp.dart';
import 'package:edutracker/Students/studentList.dart';
import 'package:edutracker/home/AdminHome.dart';
import 'package:edutracker/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'LoginSignupScreen/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'eduTracker';

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.red),
      //home: login_final(),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: HomeScreen(),
      ),
    );
  }
}
