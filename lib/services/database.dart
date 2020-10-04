import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({this.uid});

  //collection refrence
  final CollectionReference buildingCollection =
      Firestore.instance.collection('buildings');

  Future updateUserData(String buildingName, int numFloors, String floor,
      int numViolations) async {
    return await buildingCollection.document(uid).setData({
      'buidlingname': buildingName,
      'numfloors': numFloors,
      'floor': floor,
      'numViolations': numViolations,
    });
  }
}
