import 'package:firecode_violation_detection/models/user.dart';
import 'package:firecode_violation_detection/screens/authenticate/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either the Home or Authenticate widget

    final user = Provider.of<User>(context);
    print(user);
    return Authenticate();
  }
}
