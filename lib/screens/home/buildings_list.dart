import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

class BuildingList extends StatefulWidget {
  @override
  _BuildingListState createState() => _BuildingListState();
}

class _BuildingListState extends State<BuildingList> {
  @override
  Widget build(BuildContext context) {
    final buildings = Provider.of<QuerySnapshot>(context);
    //print(buildings.documents);
    for (var doc in buildings.documents) {
      print(doc.data);
    }
    return Container();
  }
}
