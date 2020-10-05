import 'package:firecode_violation_detection/models/building.dart';
import 'package:firecode_violation_detection/screens/home/settings_form.dart';
import 'package:firecode_violation_detection/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:firecode_violation_detection/services/database.dart';
import 'package:provider/provider.dart';
import 'package:firecode_violation_detection/screens/home/buildings_list.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showModalBottomSheet(
          context: context,
          builder: (context) {
            return Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 60.0),
              child: SettingsForm(),
            );
          });
    }

    return StreamProvider<List<Building>>.value(
      value: DatabaseService().buildings,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.black,
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              icon: Icon(Icons.person),
              label: Text('logout'),
              onPressed: () async {
                await _auth.signOut();
              },
            ),
            FlatButton.icon(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
              color: Colors.white,
              onPressed: () => _showSettingsPanel(),
            )
          ],
        ),
        body: BuildingList(),
      ),
    );
  }
}
