import 'package:firecode_violation_detection/models/user.dart';
import 'package:firecode_violation_detection/screens/authenticate/authenticate.dart';
import 'package:firecode_violation_detection/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either the Home or Authenticate widget

    final user = Provider.of<User>(context);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
