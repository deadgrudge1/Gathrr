import 'package:flutter/material.dart';

class OngoingMembers extends StatelessWidget {
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
          'Event Members',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Members(),
    );
  }
}

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Shreyas Hosmani', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Front-End Developer'),
              ),
            ),
          Card(
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text('Amit Chaudhari', style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),),
              subtitle: Text('Back-End Developer'),
            ),
          ),
          Card(
            color: Colors.grey.shade200,
            child: ListTile(
              leading: const Icon(Icons.person),
              title: Text('Jeet Vithalani', style: new TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),),
              subtitle: Text('UI/UX, Analytics'),
            ),
          ),
        ],
      ),
    );
  }
}


