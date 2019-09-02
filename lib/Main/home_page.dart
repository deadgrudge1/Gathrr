import 'package:flutter/material.dart';

import 'package:flutter_app/Main/bottom_nav_bar.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: BottomNavBar(),
      ),
    );
  }
}

