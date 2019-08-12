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

BuildContext context;



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
    null,
    //Center(child: SCAN()),
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
          showDialog(context: context,builder: (context) => _onScanPass(context, result));
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
          showDialog(context: context,builder: (context) => _onScanFail(context));
        });
      } else {
        setState(() {
          result = "Unknown Error $ex";
          showDialog(context: context,builder: (context) => _onScanFail(context));
        });
      }
    } on FormatException {
      setState(() {
        result = "You pressed the back button before scanning anything";
        showDialog(context: context,builder: (context) => _onScanFail(context));
      });
    } catch (ex) {
      setState(() {
        result = "Unknown Error $ex";
        showDialog(context: context,builder: (context) => _onScanFail(context));
      });
    }
  }

  _onScanFail(BuildContext context) {
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
              child: Text('FAIL!', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.all(25.0),
              child: Text("Scan failed! Please try scanning the qr of user or an event!", style: TextStyle(color: Colors.black),),
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
        children: widget._children,
      ), //bottom nav pages won't reload everytime
      bottomNavigationBar: BottomNavigationBar(
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
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}