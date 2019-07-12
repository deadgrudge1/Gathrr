import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
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
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: settingOptions(),
    );
  }
}

class settingOptions extends StatefulWidget {
  @override
  _settingOptionsState createState() => _settingOptionsState();
}

class _settingOptionsState extends State<settingOptions> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              title: new Text(
                "Log Out",
                style: new TextStyle(
                fontSize: 18,
                color: Colors.grey.shade600),
              ),
            ),
            new Container(
              height: 1.5,
              color: Colors.grey.shade100,
            ),
            ListTile(
              title: new Text(
                "Privacy Policy",
                style: new TextStyle(
                    fontSize: 18,
                  color: Colors.grey.shade600
                ),
              ),
            ),
            new Container(
              height: 1.5,
              color: Colors.grey.shade100,
            ),
            ListTile(
              title: new Text(
                "Licenses",
                style: new TextStyle(
                    fontSize: 18,
                    color: Colors.grey.shade600
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
