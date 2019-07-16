import 'package:flutter/material.dart';
import 'package:flutter_app/ui/home_my_contacts.dart';
import 'package:flutter_app/ui/home_my_qr.dart';
import 'package:flutter_app/ui/home_scan_qr.dart';
import 'package:flutter_app/ui/main_profile.dart';
import 'main_home_with_upper_bar.dart';

class BottomNavBar extends StatefulWidget {
  final List<Widget> _children = [
    Center(child: MainHomeWithUpperBar()),
    Center(child: MyContacts()),
    Center(child: SCAN()),
    Center(child: MYQR()),
    Center(child: MainProfile()),
  ];
  @override
  _BottomNavBarState createState() {
    return _BottomNavBarState();
  } //bottom nav pages won't reload everytime (problem - contact and profile page is same and profile page won't reload)
  //_BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    Center(child: MainHomeWithUpperBar()),
    Center(child: MyContacts()),
    Center(child: SCAN()),
    Center(child: MYQR()),
    Center(child: MainProfile()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //body: _children[_currentIndex],
      body: IndexedStack(
        index: _currentIndex,
        children: widget._children,
      ), //bottom nav pages won't reload everytime
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20.0,
        selectedFontSize: 15.0,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.shifting,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('My-Contacts'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.center_focus_strong),
            title: new Text('Scan'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.aspect_ratio),
              title: Text('My-QR')
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profile')
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}