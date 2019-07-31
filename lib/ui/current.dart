import 'package:flutter/material.dart';

class Current extends StatefulWidget {
  @override
  _CurrentState createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          new Card(
            child: new Column(
              children: <Widget>[
                Container(
                  child: new Image.asset("images/bookingapp.png"),
                ),
                ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Column(
                      children: <Widget>[
                        Text("Aug"),
                        Text("01")
                      ],
                    ),
                  ),
                  title: Text('Artificial Intelligence Impact'.toUpperCase(), style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),),
                  subtitle: Text('July 2019.'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
