import 'package:flutter/material.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:fw_ticket/fw_ticket.dart';

class SCAN extends StatefulWidget {
  @override
  _SCANState createState() => _SCANState();
}

class _SCANState extends State<SCAN> {
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
                    color: Colors.blue,
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
                      "SUCCESS",
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
                          "Scan Successful, please pull to refresh",
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "your contacts list!",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //color: Colors.green,
            ),
            Container(
              height: 100.0,
              child: Center(
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
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              //color: Colors.green,
            ),
            /*
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

             */
          ],
        ),
      ),
    );
  }

  _onScanPass(BuildContext context, result) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      //this right here
      child: Container(
        height: 300.0,
        width: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'SUCCESS',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Scan successful! \n $result Please pull to refresh your contact list!',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            FlatButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Discard',
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue.shade900,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.blue.shade900, Colors.blue.shade500],
              ),
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/gathrr_name.png"),
          )),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
                child: Container(
                    //color: Colors.white,
                    height: 450,
                    width: 500,
                    child: Ticket(
                      innerRadius: BorderRadius.only(
                        bottomRight: Radius.circular(32),
                        bottomLeft: Radius.circular(32),
                      ),
                      outerRadius: BorderRadius.circular(0.0),
                      child: Card(
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 35.0, bottom: 10.0),
                              child: Center(
                                child: Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      border: new Border.all(
                                        width: 2,
                                        color: Colors.white,
                                      ),
                                      shape: BoxShape.circle,
                                      /*
                                      image: DecorationImage(
                                        fit: BoxFit.fill,
                                        image: NetworkImage("images/qr.png"),
                                      ),
                                       */
                                  ),
                                  child: Image.asset("images/qr.png"),
                                ),
                              ),
                            ),
                            Text("Your Ticket To Networking",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30.0,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Text("Scan the Event-QR to check-into a live Event"),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                              child: Text("OR",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold
                                ),
                              ),
                            ),
                            Text("Scan the User-QR to add the User into your contacts"),
                          ],
                        ),
                      ),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, top: 490),
                child: Container(
                    //color: Colors.white,
                    height: 150,
                    width: 500,
                    child: Ticket(
                      innerRadius: BorderRadius.only(
                        topRight: Radius.circular(32),
                        topLeft: Radius.circular(32),
                      ),
                      outerRadius: BorderRadius.circular(0.0),
                      child:
                      RaisedButton(
                        color: Colors.white,
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                              child: Container(
                                height: 55,
                                width: MediaQuery.of(context).size.width/1.7,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.grey.shade100,
                                        Colors.grey.shade100,
                                      ],
                                    ),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(50)
                                    )
                                ),
                                child: Center(
                                  child: Text('Scan'.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50,
                                      letterSpacing: 1.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          onPressed: _scanQR,
                        ),
                    )),
              ),
            ],
          ),
        ],
      ),
      /*
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  result,
                  style: new TextStyle(
                      fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                RaisedButton(
                  child: Text(
                    "Scan",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1.0,
                    ),
                  ),
                  onPressed: _scanQR,
                )
                /*Icon(Icons.camera_alt,
                size: 175.0,
                color: Colors.grey.shade700,),
                GestureDetector(
                  onTap: (){

                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 45,
                      width: 250.0,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.blue,
                              Colors.blue,
                            ],
                          ),
                          borderRadius: BorderRadius.all(
                              Radius.circular(50)
                          )
                      ),
                      child: Center(
                        child: Text('SCAN'.toUpperCase(),
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),




                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Scan For Accessing Ongoing Event",
                  style: new TextStyle(
                    fontSize: 18,
                  ),),
                ),

                 */
              ],
            ),
          ),
        ),
      ),

       */
    );
  }
}

//this code is for qrcode scanner , yet to be implemented properly

/*
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() {
    return new HomePageState();
  }
}

class HomePageState extends State<HomePage> {
  String result = "Hey there !";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
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
      appBar: AppBar(
        title: Text("QR Scanner"),
      ),
      body: Center(
        child: Text(
          result,
          style: new TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: Icon(Icons.camera_alt),
        label: Text("Scan"),
        onPressed: _scanQR,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

 */
