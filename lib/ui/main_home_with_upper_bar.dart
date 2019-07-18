import 'package:flutter/material.dart';
import 'package:flutter_app/ui/chat_screen.dart';
import 'package:flutter_app/ui/current.dart';
import 'package:flutter_app/ui/past.dart';
import 'package:flutter_app/ui/upcoming.dart';
import 'package:flutter_app/ui/upcoming_event_page.dart';
import 'package:flutter_app/ui/notification_screen.dart';

class MainHomeWithUpperBar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.notifications,
                color: Colors.grey.shade300,),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EventNotices()),
                );
              },
            ),
            actions: <Widget>[
               IconButton(
                icon: new Icon(Icons.chat_bubble,
                  color: Colors.grey.shade300,),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );
                },
              ),
            ],
            backgroundColor: Colors.blue.shade900,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.blue.shade900,
                    Colors.blue.shade500
                  ],
                ),
              ),
            ),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.photo),
                text: "Upcoming Events",),
                Tab(icon: Icon(Icons.assignment),
                text: "Ongoing Events",),
                Tab(icon: Icon(Icons.add_photo_alternate),
                text: "Previos Events",),
              ],
            ),
            centerTitle: true,
            title: Text('gathrr', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Next(),
              Current(),
              Past(),
            ],
          ),
        ),
      ),
    );
  }
}
