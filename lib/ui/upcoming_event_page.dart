import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Ongoing extends StatelessWidget {
  final String eventID;
  Ongoing(this.eventID) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          new IconButton(
            onPressed: (){},
            icon: new Icon(Icons.share,
            color: Colors.grey.shade300,),
          )
        ],
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
        title: Text(
          'gathrr',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      body: EventPage(eventID),
    );
  }
}

class EventPage extends StatefulWidget {
  final String eventID;  //fetch details using this id
  EventPage(this.eventID) : super();
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

  var event;
  String event_title;

  @override
  void initState() {
    getData(context);
  }

  void getData(context) async
  {
    String eventID = widget.eventID;
    print("Event ID : " + eventID);
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if(token!=null)
    {
      String url = globals.url + "events.php";
      http.post(url, body: {
        "token" : token,
        "event_id" : eventID,
      })
          .then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error fetching data");
        }

        //var status = responseArray['status'];

        event = json.decode(response.body);
        setState(() {

          event = event[0];
        });

        print(event);
        //return true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 5.0, left: 15.0, right: 15.0),
          child: new Column(
            children: <Widget>[
              new Icon(
                Icons.image,
                size: 200,
                color: Colors.grey.shade800,
              ),
              Text(
                event['event_title']/*'Building Serverless Chatbots using Amazon Lex and Lambda'*/,
                style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "by " + event['event_organization'],
                    style: new TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text('Friday, July 5th'),
                subtitle: Text('5.00 PM - 6:30 PM IST'),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text('Gathrr Technologies'),
                subtitle: Text('A-wing, Amanora Park Town, Hadapsar, Pune'),
              ),
              ListTile(
                leading: const Icon(Icons.free_breakfast),
                title: Text('Free'),
                subtitle: Text('on Gathrr.in'),
              ),
              new Container(
                height: 1.5,
                color: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "About",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                    "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android and iOS, as well as being the primary method of creating applications for Google Fuchsia."),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "See more...",
                    style: new TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              new Container(
                height: 1.5,
                color: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Location",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              new Icon(
                Icons.location_on,
                size: 200,
                color: Colors.grey.shade800,
              ),
              new Container(
                height: 1.5,
                color: Colors.grey.shade200,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Organiser",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Gathrr Technologies",
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                    "Flutter is an open-source mobile application development framework created by Google. It is used to develop applications for Android and iOS, as well as being the primary method of creating applications for Google Fuchsia."),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Organiser Details...",
                    style: new TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

}
