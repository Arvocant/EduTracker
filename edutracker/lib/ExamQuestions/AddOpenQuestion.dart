import 'package:flutter/material.dart';

class AddOpenQuestion extends StatefulWidget {
  AddOpenQuestion({Key key}) : super(key: key);

  @override
  State<AddOpenQuestion> createState() => _AddOpenQuestionState();
}

class _AddOpenQuestionState extends State<AddOpenQuestion> {
  TextEditingController vraagController = TextEditingController();
  TextEditingController antwoordenController = TextEditingController();
  TextEditingController oplossingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Voeg een open vraag toe',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(25),
                  width: 150,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Vraag:",
                      style: TextStyle(fontSize: 24, color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  child: TextField(
                    controller: vraagController,
                    decoration: const InputDecoration(
                      hintText: "Zet hier de vraag",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) {
                      setState(() {
                        vraagController.text = val.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                minimumSize: Size(200, 70),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Vraag opslaan"),
            ),
          ],
        ),
      ),
    );
  }
}
