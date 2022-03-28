import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class login_final extends StatefulWidget {
  const login_final({Key? key}) : super(key: key);

  @override
  State<login_final> createState() => _login_finalState();
}

class _login_finalState extends State<login_final> {
  //form key
  final _formKey = GlobalKey<FormState>();

  //Editing controller
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    //email field
    final emailField = TextFormField(
      autofocus: false,
      controller: emailController,
      keyboardType: TextInputType.emailAddress,
      //validator: (),
      onSaved: (value) {
        emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(Icons.mail),
          contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15)),
    );

    final passwordField = TextFormField(
      autofocus: false,
      controller: passwordController,
      keyboardType: TextInputType.emailAddress,
      //validator: (),
      onSaved: (value) {
        passwordController.text = value!;
      },
      textInputAction: TextInputAction.done,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[emailField, passwordField],
              )),
        ),
      )),
    );
  }
}
