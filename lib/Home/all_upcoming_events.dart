import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Home/all_upcoming_events.dart';
import 'package:flutter_app/util/models.dart';
import 'package:flutter_app/widgets/tabs_chips.dart';
import 'package:flutter_app/Chat/chat_screen.dart';
import 'package:flutter_app/Notifications/notification_screen.dart';
import 'package:flutter_app/util/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/upper_curve_clipper.dart';
import 'package:flutter_app/widgets/boxfield.dart';
import 'package:flutter_app/util/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AllUpcoming extends StatefulWidget {
  @override
  _AllUpcomingState createState() => _AllUpcomingState();
}

class _AllUpcomingState extends State<AllUpcoming> {

  Screen size;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.grey.shade50,
        /*
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade900, Colors.blue.shade500],
            ),
          ),
        ),

         */
        title: Text("all upcoming events...",
          style: TextStyle(
            color: Colors.blueGrey,
            fontSize: 18.0
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text("132 events",
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black45
                ),
              ),
            ),
            //propertyCard(),
            Container(
              color: Colors.blueGrey.shade50,
              child: Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        height: 100.0,
                        width: 100.0,
                        decoration: new BoxDecoration(
                          image: DecorationImage(
                            image: new AssetImage(
                                "images/bookingapp.png"),
                            fit: BoxFit.fill,
                          ),
                          shape: BoxShape.rectangle,
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Social NETwork",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 25.0,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                                Text("Koregaon Park, ",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                Text("Pune, ",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                            Text("Aug 8",
                              style: TextStyle(
                                fontSize: 12.0,
                              ),
                            ),
                            //Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  color: Colors.blueGrey.shade50,
                  child: Row(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Container(
                            child: FlutterLogo(),
                            height: 100.0,
                            width: 100.0,
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              image: DecorationImage(
                                image: new AssetImage(
                                    ""),
                                fit: BoxFit.fill,
                              ),
                              shape: BoxShape.rectangle,
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Hotel Management",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 25.0,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Text("Westin, KP , Pune,",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                                //Spacer(),
                                Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text("17 Aug",
                                    style: TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                color: Colors.blueGrey.shade50,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: FlutterLogo(),
                          height: 100.0,
                          width: 100.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: new AssetImage(
                                  ""),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        )
                        /*
                          Container(
                            height: 125.0,
                            width: 125.0,
                            child: Image.asset(
                              "assets/hall_2.jpeg",
                            ),
                          ),

                           */
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Event Management",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text("Koregaon Park, Pune,",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              //Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text("20 Aug",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                color: Colors.blueGrey.shade50,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: new AssetImage(
                                  "assets/onboard_1.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        )
                        /*
                          Container(
                            height: 125.0,
                            width: 125.0,
                            child: Image.asset(
                              "assets/onboard_1.png",
                            ),
                          ),

                           */
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Dart Master",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text("Kalyani Nagar, Pune,",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              //Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text("22 Aug",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                color: Colors.blueGrey.shade50,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: new AssetImage(
                                  "assets/onboard_2.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        )
                        /*
                          Container(
                            height: 125.0,
                            width: 125.0,
                            child: Image.asset(
                              "assets/onboard_2.png",
                            ),
                          ),

                           */
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Art Of UI/UX",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text("Amanora ParkTown, Pune,",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              //Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text("28 Aug",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                color: Colors.blueGrey.shade50,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          child: FlutterLogo(),
                          height: 100.0,
                          width: 100.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: new AssetImage(
                                  ""),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        )
                        /*
                          Container(
                            height: 125.0,
                            width: 125.0,
                            child: Image.asset(
                              "assets/hall_1.jpg",
                            ),
                          ),

                           */
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Hotel Management",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text("Westin, KP , Pune,",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              //Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text("17 Aug",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
              child: Container(
                color: Colors.blueGrey.shade50,
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          width: 100.0,
                          decoration: new BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                              image: new AssetImage(
                                  "images/bookingapp.png"),
                              fit: BoxFit.fill,
                            ),
                            shape: BoxShape.rectangle,
                          ),
                        )
                        /*
                          Container(
                            height: 125.0,
                            width: 125.0,
                            child: Image.asset(
                              "assets/hall_1.jpg",
                            ),
                          ),

                           */
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Hotel Management",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              fontSize: 25.0,
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Text("Westin, KP , Pune,",
                                style: TextStyle(
                                  fontSize: 12.0,
                                ),
                              ),
                              //Spacer(),
                              Padding(
                                padding: const EdgeInsets.only(left: 5.0),
                                child: Text("17 Aug",
                                  style: TextStyle(
                                    fontSize: 12.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /*
            Container(
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: GestureDetector(
                      onTap: (){
                        //Navigator.push(context,
                          //MaterialPageRoute(builder: (context) => EventNow()),
                        //);
                      },
                      child: new Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        ),
                        child: new Column(
                          //crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Container(
                              height: 150.0,
                              child: new Image.asset("images/upcoming_sample.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Column(
                                  children: <Widget>[
                                    Text("Aug"),
                                    Text("10")
                                  ],
                                ),
                              ),
                              title: Text('forbes fashion'.toUpperCase(), style: new TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),),
                              subtitle: Text('EFC Business Centre, Koregaon Park'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 133.0, left: 235.0, bottom: 5.0),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(right: 6.0),
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  heroTag: null,
                                  backgroundColor: Colors.white,
                                  onPressed: (){},//showNotification,
                                  //color: Colors.blue.shade300,
                                  child: Icon(Icons.people,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              child: FittedBox(
                                child: FloatingActionButton(
                                  heroTag: null,
                                  backgroundColor: Colors.white,
                                  onPressed: (){

                                  },
                                  //color: Colors.blue.shade300,
                                  child: Icon(Icons.notifications_active,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Stack(
              children: <Widget>[
                Container(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    ),
                    child: new Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Container(
                          height: 150.0,
                          child: new Image.asset("images/bookingapp.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                        ListTile(
                          leading: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Column(
                              children: <Widget>[
                                Text("Aug"),
                                Text("10")
                              ],
                            ),
                          ),
                          title: Text('a.i impact'.toUpperCase(), style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),),
                          subtitle: Text('S.B Road'),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 133.0, left: 235.0, bottom: 5.0),
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 6.0),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            child: FittedBox(
                              child: FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Colors.white,
                                onPressed: (){

                                },
                                //color: Colors.blue.shade300,
                                child: Icon(Icons.people,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 6.0),
                          child: Container(
                            height: 40.0,
                            width: 40.0,
                            child: FittedBox(
                              child: FloatingActionButton(
                                heroTag: null,
                                backgroundColor: Colors.white,
                                onPressed: (){

                                },
                                //color: Colors.blue.shade300,
                                child: Icon(Icons.notifications_active,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

             */
          ],
        ),
      ),
    );
  }

  Padding leftAlignText({text, leftPadding, textColor, fontSize, fontWeight}) {
    return Padding(
      padding: EdgeInsets.only(left: leftPadding),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(text??"",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontFamily: 'Exo2',
                fontSize: fontSize,
                fontWeight: fontWeight ?? FontWeight.w500,
                color: textColor)),
      ),
    );
  }

  Card propertyCard() {
    return Card(
        elevation: 4.0,
        margin: EdgeInsets.all(8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        borderOnForeground: true,
        child: Container(
            height: 150.0,
            width: 50.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12.0),
                        topRight: Radius.circular(12.0)),
                    child: Image.asset('assets/hall_1.jpg}',
                        fit: BoxFit.fill)),
                SizedBox(height: 8.0),
                leftAlignText(
                  text: "Hello World One",
                  leftPadding: 8.0,
                  textColor: Colors.black,
                  fontSize: 14.0,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(height: 8.0),
                leftAlignText(
                  text: "Hello World Two",
                  leftPadding: 8.0,
                  textColor: Colors.black,
                  fontSize: 13.0,
                  //fontWeight: FontWeight.w800),
                ),
                leftAlignText(
                    text: "Hello World Three",
                    leftPadding: 8.0,
                    textColor: Colors.black54,
                    fontSize: 12.0),
              ],
            )));
  }


}
