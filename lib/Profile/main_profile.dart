import 'package:flutter/material.dart';
import 'package:flutter_app/Profile/edit_profile_screen.dart';
import 'package:flutter_app/Profile/profile_page.dart';
import 'package:flutter_app/Profile/setting_screen.dart';

class MainProfile extends StatelessWidget {

  //showDialog(
  //context: context, builder: (context) => _onFirstTapOnProfile(context));
  //use the above function for calling...
  _onFirstTapOnProfile(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                  ),
                  height: 100.0,
                  //color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: Text(
                      "ALERT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 100.0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          "Please create your profile",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "to get maximum benefits!",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //color: Colors.green,
            ),
            Container(
              height: 100.0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
                  child: Container(
                    height: 30,
                    width: MediaQuery.of(context).size.width / 3.5,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey.shade400,
                            Colors.grey.shade400,
                          ],
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Center(
                      child: Text(
                        'CLOSE'.toUpperCase(),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //color: Colors.green,
            ),
            /*
            Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text('FAIL!', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text("Scan failed! Please try scanning the qr of user or an event!", style: TextStyle(color: Colors.black),),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            },
                child: Text('Discard', style: TextStyle(color: Colors.black, fontSize: 18.0),))

             */
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
