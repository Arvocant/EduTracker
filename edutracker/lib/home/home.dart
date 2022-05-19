import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("eduTracker"),
      ),
      body: Center(
        child: Row(
          children: const [
            ElevatedButton(
              onPressed: null,
              child: Text("Student"),
            ),
            ElevatedButton(
              onPressed: null,
              child: Text("Admin"),
            ),
          ],
        ),
      ),
    );
  }
}
