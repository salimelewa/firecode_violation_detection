import 'package:firecode_violation_detection/screens/home/home.dart';
import 'package:flutter/material.dart';

/// This is the main application widget.
class InitailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: MyStatelessWidget(),
      ),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyStatelessWidget extends StatelessWidget {
  MyStatelessWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            width: 200,
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Buildings',
                  style: TextStyle(fontSize: 13, fontFamily: 'Roboto')),
              textColor: Colors.black,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 200,
            child: RaisedButton(
              onPressed: () {},
              child: Text('Add Buildings',
                  style: TextStyle(fontSize: 13, fontFamily: 'Roboto')),
              textColor: Colors.black,
              color: Colors.white,
            ),
          ),
          SizedBox(
            width: 200,
            child: RaisedButton(
              onPressed: () {},
              child: Text('Violations',
                  style: TextStyle(fontSize: 13, fontFamily: 'Roboto')),
              textColor: Colors.black,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
