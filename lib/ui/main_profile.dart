import 'package:flutter/material.dart';
import 'package:flutter_app/ui/edit_profile_screen.dart';
import 'package:flutter_app/ui/profile_page.dart';
import 'package:flutter_app/ui/setting_screen.dart';

class MainProfile extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        /*flexibleSpace: Container(
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
        ),*/
        leading: IconButton(
          icon: Icon(Icons.settings,
            color: Colors.grey.shade300,),
          onPressed: (){
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => Settings()),
            );
          },
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.edit,
              color: Colors.grey.shade300,),
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditScren()),
              );
            },
          ),
        ],
        title: Text('Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.blue.shade900,
      ),
      body: new ProfilePage(""),
    );
  }
}
