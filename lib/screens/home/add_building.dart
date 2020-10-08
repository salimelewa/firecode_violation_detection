import 'package:firecode_violation_detection/shared/constants.dart';
import 'package:flutter/material.dart';

/// This is the main application widget.
class AddBuilding extends StatelessWidget {
  _AddBuildingFormState createState() => _AddBuildingFormState();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: AddBuildingForm(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class AddBuildingForm extends StatefulWidget {
  AddBuildingForm({Key key}) : super(key: key);

  @override
  _AddBuildingFormState createState() => _AddBuildingFormState();
}

class _AddBuildingFormState extends State<AddBuildingForm> {
  final _formKey = GlobalKey<FormState>();

  final List<String> floors = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10'
  ];

  // ignore: unused_field
  var _numFloors = 0;

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
          DropdownButtonFormField(
            decoration: textInputDecoration,
            value: '1',
            items: floors.map((floors) {
              return DropdownMenuItem(
                value: floors,
                child: Text('$floors'),
              );
            }).toList(),
            onChanged: (val) => setState(() => _numFloors = val),
          ),
          // TextFormField(
          //     validator: (val) =>
          //         val.isEmpty ? 'Enter a how many floors.' : null,
          //     decoration:
          //         textInputDecoration.copyWith(labelText: 'Number of floors'),
          //     onChanged: (val) {}),
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
