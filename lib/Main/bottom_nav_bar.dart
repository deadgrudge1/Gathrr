import 'package:flutter/material.dart';
import 'package:flutter_app/util/custom_icons.dart';
import 'package:flutter_app/Contacts/home_my_contacts.dart';
import 'package:flutter_app/My-QR/home_my_qr.dart';
import 'package:flutter_app/Scan/home_scan_qr.dart';
import 'package:flutter_app/Profile/main_profile.dart';
import 'package:flutter_app/Home/main_home_with_upper_bar.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';

import 'package:flutter_app/Main/layout.dart';
import 'package:flutter_app/Main/fab_bottom_app_bar.dart';
import 'package:flutter_app/Main/fab_with_icons.dart';

class BottomNavBar extends StatefulWidget {
  final List<Widget> children = [
    Center(child: SearchPage()),
    Center(child: MyContacts()),
    //Center(child: SCAN()),
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

  String _lastSelected = 'TAB: 0';

  void _selectedTab(int index) {
    setState(() {
      _lastSelected = 'TAB: $index';
    });
  }

  void _selectedFab(int index) {
    setState(() {
      _lastSelected = 'FAB: $index';
    });
  }

  int _currentIndex = 0;
  final List<Widget> children = [
    Center(child: SearchPage()),
    Center(child: MyContacts()),
    //null,
    //Center(child: SCAN()),
    Center(child: MYQR()),
    Center(child: MainProfile()),
  ];

  String result = "Hey there !";


  void qrFunction() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if (token != null) {
      String url = globals.url + "scan-qr.php";
      http.post(url, body: {
        "token": token,
        "qr_token": result,
      }).then((http.Response response) {
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
          showDialog(
              context: context,
              builder: (context) => _onScanPass(context, result));
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
          showDialog(
              context: context, builder: (context) => _onScanFail(context));
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
          showDialog(
              context: context, builder: (context) => _onScanFail(context));
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
        showDialog(
            context: context, builder: (context) => _onScanFail(context));
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
        showDialog(
            context: context, builder: (context) => _onScanFail(context));
      });
    }
  }

  _onScanFail(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12),
                        topLeft: Radius.circular(12)),
                  ),
                  height: 100.0,
                  //color: Colors.green,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Center(
                    child: Text(
                      "ALERT",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
            Container(
              height: 100.0,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                        child: Text(
                          "You pressed the back button",
                          style: TextStyle(
                            wordSpacing: 1,
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "before scanning anything!",
                        style: TextStyle(
                          wordSpacing: 1.0,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 100.0,
              child: Center(
                child: GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
                    child: Container(
                      height: 30,
                      width: MediaQuery.of(context).size.width / 3.5,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.grey.shade400,
                              Colors.grey.shade400,
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: Center(
                        child: Text(
                          'CLOSE'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _onScanPass(BuildContext context, result) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 300.0,
        width: 300.0,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text('SUCCESS', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Scan successful! \n $result Please pull to refresh your contact list!', style: TextStyle(color: Colors.black),),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            },
                child: Text('Discard', style: TextStyle(color: Colors.black, fontSize: 18.0),))
          ],
        ),
      ),
    );
  }

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      //body: _children[_currentIndex],
      body: IndexedStack(
        index: _currentIndex,
        children: widget.children,
      ), //bottom nav pages won't reload everytime
      bottomNavigationBar:
      FABBottomAppBar(
        centerItemText: '',
        color: Colors.black,
        selectedColor: Colors.blue,
        notchedShape: CircularNotchedRectangle(),
        onTabSelected: onTabTapped,
        items: [
          FABBottomAppBarItem(iconData: IconData(0xe90c, fontFamily: 'pro'), text: ''),
          FABBottomAppBarItem(iconData: Icons.contacts, text: ''),
          FABBottomAppBarItem(iconData: IconData(0xe908, fontFamily: 'pro'), text: ''),
          FABBottomAppBarItem(iconData: IconData(0xe90a, fontFamily: 'pro'), text: ''),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _buildFab(
          context),


      /*
      BottomNavigationBar(
        iconSize: 25.0,
        elevation: 20.0,
        //selectedFontSize: 15.0,
        unselectedItemColor: Colors.grey.shade800,
        selectedItemColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // this will be set when a new tab is tapped
        items: [
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: new Icon(IconData(0xe90c, fontFamily: 'pro'),
              //color: Colors.grey.shade700,
              ),
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Icon(IconData(0xe90b, fontFamily: 'pro')),
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: const EdgeInsets.only(top: 5.0),
              child: Icon(IconData(0xe900, fontFamily: 'pro')),
            ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Icon(IconData(0xe908, fontFamily: 'pro')),
              ),
            title: Text(""),
          ),
          BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Icon(IconData(0xe90a, fontFamily: 'pro')),
              ),
            title: Text(""),
          ),
        ],
      ),

       */
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _buildFab(BuildContext context) {
    //final icons = [ Icons.sms, Icons.mail, Icons.phone ];
    return FloatingActionButton(
        onPressed: _scanQR,
        tooltip: 'Scan',
        child: Icon(IconData(0xe900, fontFamily: 'pro'),
          size: 30.0,
        ),
        elevation: 15.0,
      );
  }

}