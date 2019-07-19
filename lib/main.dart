import 'package:flutter/material.dart';
import 'package:flutter_app/ui/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ui/login.dart';


void main(){
  //getData();
  isSplash();
}

void isSplash() async {
  final prefs = await SharedPreferences.getInstance();
  var isSplash = false;
  try {
    isSplash = prefs.getBool("isSplash");
    if(isSplash == true)
    {
      var title = "Login";
      runApp(new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: Login(),
      ));
    }else{
      throw new Exception();
    }
  }catch(e){
    var title = "Login";
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: SplashScreen(),
    ));
  }

}

