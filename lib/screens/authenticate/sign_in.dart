import 'package:firecode_violation_detection/services/auth.dart';
import 'package:firecode_violation_detection/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firecode_violation_detection/shared/constants.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;

  const SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

  //text field state
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.black54,
              elevation: 0.0,
              title: Text('Log In'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () {
                    widget.toggleView();
                  },
                )
              ],
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 40.0),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter an Email' : null,
                        decoration:
                            textInputDecoration.copyWith(labelText: 'Email'),
                        keyboardType: TextInputType.emailAddress,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Enter a password' : null,
                        decoration:
                            textInputDecoration.copyWith(labelText: 'Password'),
                        obscureText: true,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                      ),
                      SizedBox(height: 5.0),
                      RaisedButton(
                        color: Colors.black,
                        child: Text(
                          'Log In',
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result =
                                await _auth.signInWithEmail(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Could not sign in with credentials';
                                loading = false;
                              });
                            }
                          }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ],
                  ),
                )));
  }
}
