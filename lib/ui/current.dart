import 'package:flutter/material.dart';

class Current extends StatefulWidget {
  @override
  _CurrentState createState() => _CurrentState();
}

class _CurrentState extends State<Current> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        new Card(
          child: new Column(
            children: <Widget>[
              new Icon(Icons.image,
                size: 150,
                color: Colors.blueGrey,),
              ListTile(
                leading: const Icon(Icons.album),
                title: Text('Artificial Intelligence Impact', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('July 2019.'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
