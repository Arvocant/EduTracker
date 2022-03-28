// ignore_for_file: prefer_const_constructors

import 'package:edutracker/LoginSignupScreen/login_final.dart';
import 'package:edutracker/LoginSignupScreen/signup.dart';
import 'package:flutter/material.dart';

import 'LoginSignupScreen/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'eduTracker';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(primarySwatch: Colors.red),
      //home: login_final(),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const SignUp(),
      ),
    );
  }
}
