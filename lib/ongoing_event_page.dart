import 'package:flutter/material.dart';

class Ongoing extends StatefulWidget {
  @override
  _OngoingState createState() => _OngoingState();
}

class _OngoingState extends State<Ongoing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade500
              ],
            ),
          ),
        ),
        centerTitle: true,
        title: Text('gathrr', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        ),
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          new Card(
            child: new Column(
              children: <Widget>[
                new Icon(Icons.image,
                  size: 150,
                  color: Colors.blueGrey,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30.0),
                  child: ListTile(
                    leading: const Icon(Icons.album),
                    title: Text('Artificial Intelligence Impact', style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),),
                    subtitle: Text('July 2019.'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 400.0),
                  child: Text("The most awaited event", style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

