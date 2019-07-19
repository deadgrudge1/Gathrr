import 'package:flutter/material.dart';
import 'package:flutter_app/ui/splash_screen.dart';
import './ui/login.dart';


void main(){
  //getData();
  var title = "Login";
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    title: title,
    home: SplashScreen(),
  ));
}

