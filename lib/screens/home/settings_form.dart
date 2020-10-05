import 'package:flutter/material.dart';
import 'package:firecode_violation_detection/shared/constants.dart';

class SettingsForm extends StatefulWidget {
  @override
  _SettingsFormState createState() => _SettingsFormState();
}

class _SettingsFormState extends State<SettingsForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> testing = ['0', '1', '2', '3', '4'];

  //form value
  String _buildingName;
  int _numFloors;
  Map _floorsInfo;
  int _numViolations;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: <Widget>[
          Text(
            'Update your settings.',
            style: TextStyle(fontSize: 18.0),
          ),
          SizedBox(height: 20.0),
          TextFormField(
            decoration: textInputDecoration,
            validator: (val) =>
                val.isEmpty ? 'Please enter a building name' : null,
            onChanged: (val) => setState(() => _buildingName = val),
          ),
          SizedBox(height: 20.0),
          //dropdown
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: _numViolations ?? '0',
            items: testing.map((testing) {
              return DropdownMenuItem(
                value: testing,
                child: Text('$testing'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _numViolations = val),
          ),
          RaisedButton(
            color: Colors.black,
            child: Text(
              'Update',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () async {
              print(_buildingName);
            },
          )
        ],
      ),
    );
  }
}
