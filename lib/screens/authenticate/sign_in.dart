import 'package:firecode_violation_detection/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0.0,
          title: Text('Log In'),
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
            child: RaisedButton(
              child: Text('Sign in Anonymously'),
              onPressed: () async {
                dynamic result = await _auth.signAnonymous();
                if (result == null) {
                  print('error in signing');
                } else {
                  print('sign in');
                  print(result.uid);
                }
              },
            )));
  }
}
