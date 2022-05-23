import 'package:flutter/material.dart';

class AddCorrectCodeQuestion extends StatefulWidget {
  AddCorrectCodeQuestion({Key key}) : super(key: key);

  @override
  State<AddCorrectCodeQuestion> createState() => _AddCorrectCodeQuestionState();
}

class _AddCorrectCodeQuestionState extends State<AddCorrectCodeQuestion> {
  TextEditingController vraagController = TextEditingController();
  TextEditingController oplossingController = TextEditingController();

  void _sendDataBack(BuildContext context) {
    String textToSendBack = vraagController.text;
    print(vraagController.text);
    Navigator.pop(context, textToSendBack);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Voeg een Code Correctie vraag toe',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(25),
                      width: 200,
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Codevraag:",
                          style: TextStyle(fontSize: 24, color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                      width: 500,
                      child: TextField(
                        maxLines: 6,
                        controller: vraagController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "Zet hier de vraag",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 50),
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(25),
                      width: 200,
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Correcte code:",
                          style: TextStyle(fontSize: 24, color: Colors.red),
                        ),
                      ),
                    ),
                    Container(
                      width: 500,
                      child: TextField(
                        maxLines: 6,
                        controller: oplossingController,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          hintText: "Zet hier de oplossing",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
                onPrimary: Colors.white,
                minimumSize: Size(200, 70),
              ),
              onPressed: () {
                _sendDataBack(context);
              },
              child: Text("Vraag opslaan"),
            ),
          ],
        ),
      ),
    );
  }
}
