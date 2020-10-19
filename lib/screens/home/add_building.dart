import 'package:firecode_violation_detection/services/auth.dart';
import 'package:firecode_violation_detection/services/database.dart';
import 'package:firecode_violation_detection/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firecode_violation_detection/shared/constants.dart';
import 'dart:math';

class AddBuilding extends StatefulWidget {
  final Function toggleView;

  const AddBuilding({this.toggleView});

  @override
  _AddBuildingState createState() => _AddBuildingState();
  initState() {}
}

class _AddBuildingState extends State<AddBuilding> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading = false;

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

  var _numFloors;
  var randomizer = new Random();

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
            ),
            body: Container(
                padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
                child: Form(
                    key: _formKey,
                    child: Column(children: <Widget>[
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFormField(
                            validator: (val) =>
                                val.isEmpty ? 'Enter a building name.' : null,
                            decoration: textInputDecoration.copyWith(
                                labelText: 'Building Name'),
                            onChanged: (val) {}),
                      ),
                      SizedBox(height: 5.0),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: '# of Floors'),
                          value: '1',
                          items: floors.map((floors) {
                            return DropdownMenuItem(
                              value: floors,
                              child: Text('$floors'),
                            );
                          }).toList(),
                          onChanged: (val) => setState(() => _numFloors = val),
                        ),
                      ),
                      // for (int i = 0; i < int.parse(_numFloors.toString()); i++)
                      //   TextFormField(
                      //       validator: (val) => val.isEmpty
                      //           ? 'Enter a how many total violations.'
                      //           : null,
                      //       decoration: textInputDecoration.copyWith(
                      //           labelText:
                      //               'Number violation floor ${i + 1} has'),
                      //       keyboardType: TextInputType.number,
                      //       onChanged: (val) {}),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFormField(
                            validator: (val) => val.isEmpty
                                ? 'Enter a how many total violations.'
                                : null,
                            decoration: textInputDecoration.copyWith(
                                labelText: '# of violations'),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {}),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: RaisedButton(
                          color: Colors.black,
                          child: Text(
                            'Add Building',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () async {
                            await DatabaseService(uid: '').updateUserData(
                                "Buildingnames",
                                3,
                                {'floor1': '34', 'floor34': '32'},
                                13);
                          },
                        ),
                      )
                    ]))));
  }
}
