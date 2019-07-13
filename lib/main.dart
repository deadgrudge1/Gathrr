import 'package:flutter/material.dart';
import './ui/login.dart';


void main(){
  //getData();
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
