import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/Login/login.dart';

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
            fontSize: 22,
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

  void logOut() async
  {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if(token!=null)
    {
      String url = globals.url + "logout.php";
      http.post(url, body: {
        "token" : token,
      })
          .then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error fetching data");
        }

        var responseArray = json.decode(response.body);

        var status = responseArray['status'];
        if(status == true) {
          prefs.setString('token', null);
          print(responseArray['msg']);
          //Navigator.pop(context);
          /*Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Login()),
          );*/
          do
            {
              Navigator.pop(context);
            }while(Navigator.canPop(context));

          Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Login()),
          );

          var title = "Login";
          runApp(new MaterialApp(
            //debugShowCheckedModeBanner: false,
            title: title,
            home: new Login(

            ),
          ));

        }
        return true;
      });
    }
  }

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
              onTap: logOut,
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
