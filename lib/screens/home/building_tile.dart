import 'package:flutter/material.dart';
import 'package:firecode_violation_detection/models/building.dart';

class BuildingTile extends StatelessWidget {
  final Building building;
  BuildingTile({this.building});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 8),
        child: Card(
            margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 25.0,
                backgroundColor: Colors.black,
              ),
              title: Text(building.buildingName),
              subtitle:
                  Text('There is ${building.numViolations} violation(s).'),
            )));
  }
}
