import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firecode_violation_detection/models/building.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection refrence
  final CollectionReference buildingCollection =
      Firestore.instance.collection('buildings');

  Future updateUserData(String buildingName, int numFloors, Map floorsInfo,
      int numViolations) async {
    return await buildingCollection.document(uid).setData({
      'buidlingname': buildingName,
      'numfloors': numFloors,
      'floorsInfo': floorsInfo ?? '',
      'numViolations': numViolations,
    });
  }

  Future addBuildingData(String buildingName, int numFloors, Map floorsInfo,
      int numViolations) async {
    return await buildingCollection.document(uid).setData({
      'buidlingname': buildingName,
      'numfloors': numFloors,
      'floorsInfo': floorsInfo ?? '',
      'numViolations': numViolations,
    });
  }

  //building list from snapshot
  List<Building> _buildingListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Building(
          buildingName: doc.data['buildingName'] ?? '',
          numFloors: doc.data['numFloors'] ?? 0,
          floorsInfo: doc.data['floorsInfo'] ?? '',
          numViolations: doc.data['numViolations'] ?? 0);
    }).toList();
  }

  //get buidlings stream
  Stream<List<Building>> get buildings {
    return buildingCollection.snapshots().map(_buildingListFromSnapshot);
  }
}
