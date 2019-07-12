import 'package:flutter/material.dart';
import './ui/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ui/home_page.dart';

void main(){
  getData();
  var title = "Login";
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: new Login(
      title: title,
    ),
  ));
}
//this is a main class
Future<bool> getData() async{
  var token;
  final prefs = await SharedPreferences.getInstance();
  token = prefs.get("token");
  if(token != null) {
    print("It worked! " + token);
    /*Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );*/
    var title = "Home";
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: new HomePage(

      ),
    ));
    return true;
  }
  else
    return false;
}