import 'package:flutter/material.dart';
import './ui/login.dart';

void main(){
  var title = "Login";
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: new Login(
      title: title,
    ),
  ));
}