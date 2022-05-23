import 'package:edutracker/models/person.dart';
import 'package:flutter/material.dart';

import 'personas.dart';

class AddStudentDialog extends StatefulWidget {
  final Function(Personas) addUser;

  AddStudentDialog(this.addUser);

  @override
  _AddStudentDialogState createState() => _AddStudentDialogState();
}

class _AddStudentDialogState extends State<AddStudentDialog> {
  @override
  Widget build(BuildContext context) {
    Widget buildTextField(String hint, TextEditingController controller) {
      return Container(
        margin: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
            labelText: hint,
            border: OutlineInputBorder(),
          ),
          controller: controller,
        ),
      );
    }

    var idController = TextEditingController();
    var nameController = TextEditingController();
    var sNumberController = TextEditingController();

    return Container(
      padding: EdgeInsets.all(8),
      height: 350,
      width: 400,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Add User',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Colors.blueGrey,
              ),
            ),
            buildTextField('Id', idController),
            buildTextField('Name', nameController),
            buildTextField('Student Number', sNumberController),
            ElevatedButton(
              onPressed: () {
                final user = Personas(idController.text, nameController.text,
                    sNumberController.text);
                widget.addUser(user);
                Navigator.of(context).pop();
              },
              child: Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}
