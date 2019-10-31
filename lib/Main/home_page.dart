import 'package:flutter/material.dart';
import 'package:flutter_app/Main/bottom_nav_bar.dart';
import 'package:flutter_app/all_users_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{
        '/chatscreen': (BuildContext context) => new AllUsersScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomNavBar(),
      ),
    );
  }
}
