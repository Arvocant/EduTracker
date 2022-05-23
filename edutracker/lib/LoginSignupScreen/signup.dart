import 'package:edutracker/home/home.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPWController = TextEditingController();

  String _usernameError =
      "Your password does not match the required parameters";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'eduTracker Sign Up',
                  style: TextStyle(
                      color: Color.fromARGB(255, 148, 10, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 50),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 40),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                  controller: nameController,
                  style: TextStyle(fontSize: 24),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "User Name",
                      prefixIcon: Icon(Icons.mail),
                      contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15))),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.key),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15)),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextField(
                obscureText: true,
                controller: repeatPWController,
                style: TextStyle(fontSize: 24),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Repeat Password',
                  prefixIcon: Icon(Icons.key),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                ),
              ),
            ),
            // Form(
            //     key: _form,
            //     child: ListView(children: <Widget>[
            //       Container(
            //         padding: const EdgeInsets.all(10),
            //         child: TextFormField(
            //             obscureText: true,
            //             controller: passwordController,
            //             decoration: InputDecoration(
            //                 border: OutlineInputBorder(
            //                     borderRadius: BorderRadius.circular(10)),
            //                 labelText: 'Password',
            //                 prefixIcon: Icon(Icons.key),
            //                 contentPadding:
            //                     EdgeInsets.fromLTRB(20, 15, 20, 15)),
            //             validator: (val) {
            //               if (val!.isEmpty) return 'Empty';
            //               return null;
            //             }),
            //       ),
            //       Container(
            //         padding: const EdgeInsets.all(10),
            //         child: TextFormField(
            //             obscureText: true,
            //             controller: repeatPWController,
            //             decoration: InputDecoration(
            //                 border: OutlineInputBorder(
            //                     borderRadius: BorderRadius.circular(10)),
            //                 labelText: 'Password',
            //                 prefixIcon: Icon(Icons.key),
            //                 contentPadding:
            //                     EdgeInsets.fromLTRB(20, 15, 20, 15)),
            //             validator: (val) {
            //               if (val!.isEmpty) return 'Empty';
            //               if (val != passwordController.text)
            //                 return 'Passwords do not match';
            //               return null;
            //             }),
            //       ),
            //     ])),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: ElevatedButton(
                  child: const Text(
                    'Login',
                    style: TextStyle(fontSize: 30),
                  ),
                  onPressed: () {
                    print(nameController.text);
                    print(passwordController.text);
                  },
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            ),
          ],
        ));
  }
}

bool validateStructure(String value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  return regExp.hasMatch(value);
}
