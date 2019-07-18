import 'package:flutter/material.dart';

class Past extends StatefulWidget {
  @override
  _PastState createState() => _PastState();
}

class _PastState extends State<Past> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GestureDetector(
            onTap: (){

            },
            child: new Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Column(
                    children: <Widget>[
                      new Icon(Icons.image,
                        size: 150,
                        color: Colors.blueGrey,),
                      ListTile(
                        leading: const Icon(Icons.album),
                        title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),),
                        subtitle: Text('July 2019.'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          new Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Icon(Icons.image,
                      size: 150,
                      color: Colors.blueGrey,),
                    ListTile(
                      leading: const Icon(Icons.album),
                      title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),),
                      subtitle: Text('July 2019.'),
                    ),
                  ],
                ),
              ],
            ),
          ),
          new Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Icon(Icons.image,
                      size: 150,
                      color: Colors.blueGrey,),
                    ListTile(
                      leading: const Icon(Icons.album),
                      title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),),
                      subtitle: Text('July 2019.'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
