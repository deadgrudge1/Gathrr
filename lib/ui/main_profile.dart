import 'package:flutter/material.dart';
import 'package:flutter_app/ui/edit_profile_screen.dart';
import 'package:flutter_app/ui/profile_page.dart';
import 'package:flutter_app/ui/setting_screen.dart';

class MainProfile extends StatelessWidget {

  _onFirstTapOnProfile(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 300.0,
        width: 300.0,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text('ALERT', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Please create your profile to enjoy maximum benefit of the app!', style: TextStyle(color: Colors.black),),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            },
                child: Text('Discard', style: TextStyle(color: Colors.black, fontSize: 18.0),))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    //showDialog(context: context,builder: (context) => _onFirstTapOnProfile(context));
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
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade900,
      ),
      body: new ProfilePage(""),
    );
  }
}
