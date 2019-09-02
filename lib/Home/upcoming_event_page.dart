import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
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
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("images/gathrr_name.png"),
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
  String eventTitle = "";
  String eventStartDate = "";
  String eventTime = "";
  String eventDetails = "";
  String eventOrganizationName = "";
  String eventDescription = "";
  String eventLocation = "";
  String eventOrganizationDetails = "";
  String eventAddress = "";
  
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
        event = event[0];
        setState(() {
          eventTitle = event['event_title'];
          eventOrganizationName = event['event_organization'];
          eventDescription = event['event_description'];
          eventAddress = event['event_location'];
          eventDetails = event['event_address'] + ", " + event['event_city'] + ", " + event['event_state'] + ", " + event['event_country'] + ", " + event['event_zipcode'];
          eventStartDate = event['event_start_date'].toString().substring(0, 10);
          eventTime = event['event_start_date'].toString().substring(11);
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
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                    child: new Image.asset("images/bookingapp.png"),
                ),
              ),
              /*
              new Icon(
                Icons.image,
                size: 200,
                color: Colors.grey.shade800,
              ),

               */
              Text(
                eventTitle.toUpperCase()/*'Building Serverless Chatbots using Amazon Lex and Lambda'*/,
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
                    "by " + eventOrganizationName,
                    style: new TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text(eventStartDate),
                subtitle: Text(eventTime),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text(eventOrganizationName),
                subtitle: Text(eventAddress),
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
                    eventDetails),
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
                    eventOrganizationName,
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
                    eventOrganizationDetails),
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
              /*
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                          onPressed: () {},
                          child: const Text(
                              'Members',
                              style: TextStyle(fontSize: 20,
                              color: Colors.white
                              )
                          ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.blue,
                          onPressed: () {},
                          child: const Text(
                              'Notifications',
                              style: TextStyle(fontSize: 20,
                              color: Colors.white
                              )
                          ),
                        ),
                    ),
                  ],
                ),
              ),

               */
            ],
          ),
        ),
      ],
    );
  }

}
