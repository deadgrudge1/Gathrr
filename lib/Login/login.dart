import 'package:flutter/material.dart';
import 'package:flutter_app/Login/custom_login_form.dart';
import 'package:flutter_app/Main/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';

class Login extends StatelessWidget {

  final String title;

  Login({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    //getData();
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: CustomLoginForm(),
    );
  }
}



/*Future<bool> getData() async{
  var token;
  var responseArray;
  final prefs = await SharedPreferences.getInstance();
  token = prefs.get("token");
  if(token != null) {
    print("It worked! " + token);
    String url = globals.url + "login.php";
    http.post(url, body: {
      "token" : token,
    })
        .then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error fetching data");
      }

      responseArray = json.decode(response.body);

      var status = responseArray['status'];
      if(status == true) {
        var msg = responseArray['msg'];
        print(msg);

        var title = "Home";
        runApp(new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          home: new HomePage(

          ),
        ));
        return true;

      }
      else {
        var msg = responseArray['msg'];
        print(msg);
        return false;
      }
    });

    /*Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );*/

  }
  else{

    return false;
  }
}*/


