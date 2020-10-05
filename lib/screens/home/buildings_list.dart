import 'package:firecode_violation_detection/models/building.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:firecode_violation_detection/screens/home/building_tile.dart';

class BuildingList extends StatefulWidget {
  @override
  _BuildingListState createState() => _BuildingListState();
}

class _BuildingListState extends State<BuildingList> {
  @override
  Widget build(BuildContext context) {
    final buildings = Provider.of<List<Building>>(context);

    return ListView.builder(
      itemCount: buildings.length,
      itemBuilder: (context, index) {
        return BuildingTile(building: buildings[index]);
      },
    );
  }
}
