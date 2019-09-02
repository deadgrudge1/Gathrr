import 'package:flutter/material.dart';
import 'package:flutter_app/Home/ongoing_event_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Current extends StatefulWidget {
  @override
  _CurrentState createState() => _CurrentState();
}

class _CurrentState extends State<Current> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
    var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOS = new IOSInitializationSettings();
    var initSetttings = new InitializationSettings(android, iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    debugPrint("payload : $payload");
    showDialog(
      context: context,
      builder: (_) => new AlertDialog(
        title: new Text('Notification'),
        content: new Text('$payload'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EventNow()),
                      );
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
                                onPressed: showNotification,
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
        ],
      ),
    );
  }

  showNotification() async {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,importance: Importance.Max
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, 'Gathrr', 'Hey Jeet, You have now checked-in to the event!', platform,
        payload: 'Please check the ongoing event list for a new card!');
  }
}
