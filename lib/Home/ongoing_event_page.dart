import 'package:flutter/material.dart';
import 'package:flutter_app/Home/ongoing_members.dart';
import 'package:flutter_app/Home/ongoing_notifications.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class EventNow extends StatelessWidget {
  //final String eventID;
  //Ongoing(this.eventID) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: <Widget>[
          /*
          IconButton(
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => OngoingMembers()),
              );
            },
            icon: new Icon(Icons.people,
              color: Colors.grey.shade300,),
          ),

           */
          IconButton(
            onPressed: (){
              //Navigator.push(context,
                //MaterialPageRoute(builder: (context) => OngoingNotifications()),
              //);
            },
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
      body: EventNowPage(),
    );
  }
}

class EventNowPage extends StatefulWidget {
  //final String eventID;  //fetch details using this id
  //EventPage(this.eventID) : super();
  @override
  _EventNowPageState createState() => _EventNowPageState();
}

class _EventNowPageState extends State<EventNowPage> {

  /*
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

   */

  /*
  @override
  void initState() {
    //getData(context);
  }

   */

  /*
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

   */

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
                /*eventTitle.toUpperCase()*/'EVENT TITLE',
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
                    "by Event Organiser" /*+ eventOrganizationName*/,
                    style: new TextStyle(
                      fontSize: 15.0,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.calendar_today),
                title: Text("Event Date"/*eventStartDate*/),
                subtitle: Text("Event Time (12:35pm)"/*eventTime*/),
              ),
              ListTile(
                leading: const Icon(Icons.location_on),
                title: Text("Event Location Name"/*eventOrganizationName*/),
                subtitle: Text("Event Detailed Address"/*eventAddress*/),
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
                child: Text("Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of de Finibus Bonorum et Malorum (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, Lorem ipsum dolor sit amet.., comes from a line in section 1.10.32.",
                    style: TextStyle(
                      wordSpacing: 1.5,
                    ),
                    /*eventDetails*/),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "",
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
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Image.asset("images/location.png"),
              ),
              /*
              new Icon(
                Icons.location_on,
                size: 200,
                color: Colors.grey.shade800,
              ),

               */
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
                  child: Text(""
                    /*eventOrganizationName*/,
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("Lorem Epsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged."
                    ,
                  style: TextStyle(
                    wordSpacing: 1.5,
                  ),
                  /*eventOrganizationDetails*/),
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
              new ButtonTheme.bar(
                child: new ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => OngoingNotifications()),
                          );
                        },
                        child: Center(
                          child: Container(
                              height: 40,
                              width: MediaQuery.of(context).size.width/2.5,
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      Colors.grey.shade300,
                                      Colors.grey.shade300,
                                    ],
                                  ),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(50)
                                  )
                              ),
                              child: Center(
                                child: Text('Notifications'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.grey.shade700,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    letterSpacing: 1.0,
                                  ),
                                ),
                              ),
                            ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => OngoingMembers()),
                          );
                        },
                        child: Center(
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width/2.5,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey.shade300,
                                    Colors.grey.shade300,
                                  ],
                                ),
                                borderRadius: BorderRadius.all(
                                    Radius.circular(50)
                                )
                            ),
                            child: Center(
                              child: Text('Members'.toUpperCase(),
                                style: TextStyle(
                                  color: Colors.grey.shade700,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  letterSpacing: 1.0,
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

               */
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
