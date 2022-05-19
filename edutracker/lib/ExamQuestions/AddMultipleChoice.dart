import 'package:flutter/material.dart';

class AddMultipleChoice extends StatefulWidget {
  AddMultipleChoice({Key key}) : super(key: key);

  @override
  State<AddMultipleChoice> createState() => _AddMultipleChoiceState();
}

class _AddMultipleChoiceState extends State<AddMultipleChoice> {
  TextEditingController vraagController = TextEditingController();
  TextEditingController antwoordenController = TextEditingController();
  TextEditingController oplossingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Voeg Multiple Choice Toe',
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(25),
                  width: 150,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Antwoorden:",
                      style: TextStyle(fontSize: 24, color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  child: TextField(
                    controller: antwoordenController,
                    decoration: const InputDecoration(
                      hintText: "Alle antwoorden zijn gescheiden door ' ; '",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) {
                      setState(() {
                        antwoordenController.text = val.toString();
                        antwoordenController.text.split(';');

                        List<String> splitted = val.toString().split(';');
                      });
                    },
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(25),
                  width: 150,
                  height: 50,
                  child: const Center(
                    child: Text(
                      "Oplossing:",
                      style: TextStyle(fontSize: 24, color: Colors.red),
                    ),
                  ),
                ),
                Container(
                  width: 500,
                  child: TextField(
                    controller: oplossingController,
                    decoration: const InputDecoration(
                      hintText: "De juiste oplossing",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (val) {
                      setState(() {
                        oplossingController.text = val.toString();
                      });
                    },
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
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
