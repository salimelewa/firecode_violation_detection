import 'package:firecode_violation_detection/models/building.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BuildingList extends StatefulWidget {
  @override
  _BuildingListState createState() => _BuildingListState();
}

class _BuildingListState extends State<BuildingList> {
  @override
  Widget build(BuildContext context) {
    final buildings = Provider.of<List<Building>>(context);
    buildings.forEach((building) {
      print(building.buildingName);
      print(building.numFloors);
    });

    return Container();
  }
}
