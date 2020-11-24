import 'package:firecode_violation_detection/models/building.dart';
import 'package:firecode_violation_detection/screens/home/violation_detection.dart';
import 'package:firecode_violation_detection/shared/loading.dart';
import 'package:flutter/material.dart';
import 'package:firecode_violation_detection/shared/constants.dart';

class BuildingDetails extends StatefulWidget {
  final Function toggleView;

  const BuildingDetails({this.toggleView});
  @override
  _BuildingDetailsState createState() => _BuildingDetailsState();
  //initState() {}

}

class _BuildingDetailsState extends State<BuildingDetails> {
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

  String buildingName = 'this.buildingName';
  int numFloors = 0;
  int numViolations = 0;

  @override
  Widget build(BuildContext context) {
    final Building building = ModalRoute.of(context).settings.arguments;
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
                            enabled: false,
                            initialValue: building.buildingName,
                            validator: (val) =>
                                val.isEmpty ? 'Enter a building name.' : null,
                            decoration: textInputDecoration.copyWith(
                                labelText: 'Building Name'),
                            onChanged: (val) =>
                                setState(() => buildingName = val)),
                      ),
                      SizedBox(height: 5.0),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: DropdownButtonFormField(
                          decoration: textInputDecoration.copyWith(
                              labelText: 'Floor #'),
                          value: '3',
                          items: floors.map((floors) {
                            return DropdownMenuItem(
                              value: floors,
                              child: Text('$floors'),
                            );
                          }).toList(),
                          onChanged: (val) =>
                              setState(() => numFloors = int.parse(val)),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      SizedBox(
                        height: 60,
                        width: 200,
                        child: TextFormField(
                            enabled: false,
                            initialValue: building.numViolations.toString(),
                            validator: (val) => val.isEmpty
                                ? 'Enter a how many total violations.'
                                : null,
                            decoration: textInputDecoration.copyWith(
                                labelText: '# of violations'),
                            keyboardType: TextInputType.number,
                            onChanged: (val) {
                              setState(() => numViolations = int.parse(val));
                            }),
                      ),
                      SizedBox(
                        height: 40,
                        width: 150,
                        child: RaisedButton(
                          color: Colors.black,
                          child: Text(
                            'Add Violation',
                            style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ViolationDetection()));
                          },
                        ),
                      )
                    ]))));
  }
}
