import 'package:firecode_violation_detection/shared/constants.dart';
import 'package:flutter/material.dart';

/// This is the main application widget.
class AddBuilding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          SizedBox(height: 40.0),
          TextFormField(
              validator: (val) => val.isEmpty ? 'Enter a building name.' : null,
              decoration:
                  textInputDecoration.copyWith(labelText: 'Building Name'),
              onChanged: (val) {}),
          SizedBox(height: 10.0),
          TextFormField(
              validator: (val) =>
                  val.isEmpty ? 'Enter a how many floors.' : null,
              decoration:
                  textInputDecoration.copyWith(labelText: 'Number of floors'),
              onChanged: (val) {}),
          SizedBox(height: 10.0),
          TextFormField(
              validator: (val) =>
                  val.isEmpty ? 'Enter a how many total violations.' : null,
              decoration: textInputDecoration.copyWith(
                  labelText: 'Number of violations'),
              onChanged: (val) {}),
        ]));
  }
}
