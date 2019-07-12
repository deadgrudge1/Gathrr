import 'package:flutter/material.dart';

class EventNotices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade900, Colors.blue.shade500],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Notices(),
    );
  }
}

class Notices extends StatefulWidget {
  @override
  _NoticesState createState() => _NoticesState();
}

class _NoticesState extends State<Notices> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: new CircleAvatar(
                radius: 5.0,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.black,
              ),
              title: new Text(
                "Oganiser: Sorry to inform, event has postponed 10 mins!",
                style: new TextStyle(
                    fontSize: 16,
                    //color: Colors.grey.shade600
                ),
              ),
            ),
            new Container(
              height: 1.5,
              color: Colors.grey.shade100,
            ),
            ListTile(
              leading: new CircleAvatar(
                radius: 5.0,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.black,
              ),
              title: new Text(
                "Event sponser coming in 15 mins",
                style: new TextStyle(
                    fontSize: 16,
                    //color: Colors.grey.shade600
                ),
              ),
            ),
            new Container(
              height: 1.5,
              color: Colors.grey.shade100,
            ),
            ListTile(
              leading: new CircleAvatar(
                radius: 5.0,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.black,
              ),
              title: new Text(
                "Please checkout upcoming events from us!",
                style: new TextStyle(
                    fontSize: 16,
                    //color: Colors.grey.shade600
                ),
              ),
            ),
            new Container(
              height: 1.5,
              color: Colors.grey.shade100,
            ),
          ],
        ),
      ),
    );
  }
}

