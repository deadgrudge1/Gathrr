import 'package:flutter/material.dart';
import 'package:flutter_app/ui/custom_icons.dart';
import 'package:flutter_app/ui/home_my_contacts.dart';
import 'package:flutter_app/ui/home_my_qr.dart';
import 'package:flutter_app/ui/home_scan_qr.dart';
import 'package:flutter_app/ui/main_profile.dart';
import 'main_home_with_upper_bar.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/globals.dart' as globals;
import 'dart:convert';


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

    String result = "Hey there !";


    void qrFunction() async
    {
      final prefs = await SharedPreferences.getInstance();
      var token = prefs.get("token");
      if(token!=null)
      {
        String url = globals.url + "scan-qr.php";
        http.post(url, body: {
          "token" : token,
          "qr_token" : result,
        })
            .then((http.Response response) {
          final int statusCode = response.statusCode;

          if (statusCode < 200 || statusCode > 400 || json == null) {
            throw new Exception("Error fetching data");
          }

          var responseArray = json.decode(response.body);

          //var status = responseArray['status']; //on successful execution
          //var type = responseArray['type']; //user or event?
          var msg = responseArray['msg'];
          var contact_username = responseArray['contact_username'];
          setState(() {
            result = msg + " '" + contact_username + "'";
          });
          print(response.body);
          return true;
        });
      }
    }


    Future _scanQR() async {
      try {
        String qrResult = await BarcodeScanner.scan();
        setState(() {
          result = qrResult;
        });
        qrFunction();

      } on PlatformException catch (ex) {
        if (ex.code == BarcodeScanner.CameraAccessDenied) {
          setState(() {
            result = "Camera permission was denied";
          });
        } else {
          setState(() {
            result = "Unknown Error $ex";
          });
        }
      } on FormatException {
        setState(() {
          result = "You pressed the back button before scanning anything";
        });
      } catch (ex) {
        setState(() {
          result = "Unknown Error $ex";
        });
      }


    }

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
        unselectedItemColor: Colors.grey.shade700,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('',
              style: TextStyle(
                  color: Colors.grey.shade700
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            title: Text('',
              style: TextStyle(
                  color: Colors.grey.shade700
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Container(
              height: 60.0,
              width: 60.0,
              child: FloatingActionButton(
              onPressed: _scanQR,
              tooltip: 'Scan',
              child: Icon(Icons.photo_camera),
              ),
            ),

            title: Text(""
            ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.center_focus_strong),
              title: Text('',
                style: TextStyle(
                    color: Colors.grey.shade700
                ),
              ),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('',
                style: TextStyle(
                    color: Colors.grey.shade700
                ),
              ),
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