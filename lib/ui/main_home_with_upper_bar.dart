import 'package:flutter/material.dart';
import 'package:flutter_app/ui/chat_screen.dart';
import 'package:flutter_app/ui/current.dart';
import 'package:flutter_app/ui/custom_sign_up_form.dart' as prefix0;
import 'package:flutter_app/ui/past.dart';
import 'package:flutter_app/ui/upcoming.dart';
import 'package:flutter_app/ui/upcoming_event_page.dart';
import 'package:flutter_app/ui/notification_screen.dart';



BuildContext context;

class MainHomeWithUpperBar extends StatelessWidget {

  Future<bool> _onBackPressed(){
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Do you really want to quit?"),
          actions: <Widget>[
            FlatButton(
              child: Text("No"),
              onPressed: ()=>Navigator.pop(context, false),
            ),
            FlatButton(
              child: Text("Yes"),
              onPressed: ()=>Navigator.pop(context, true),
            ),
          ],
        ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 0,
        length: 3,
        child: WillPopScope(
          onWillPop: _onBackPressed,
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: Icon(const IconData(0xe901, fontFamily: 'pro'),
                  color: Colors.grey.shade300,),
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => EventNotices()),
                  );
                },
              ),
              actions: <Widget>[
                 IconButton(
                  icon: new Icon(const IconData(0xe909, fontFamily: 'pro'),
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
                  Tab(icon: Icon(const IconData(0xe903, fontFamily: 'pro')),
                  text: "Upcoming Events",),
                  Tab(icon: Icon(const IconData(0xe904, fontFamily: 'pro')),
                  text: "Ongoing Events",),
                  Tab(icon: Icon(const IconData(0xe902, fontFamily: 'pro')),
                  text: "Previos Events",),
                ],
              ),
              centerTitle: true,
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("images/gathrr_name.png"),
              ),
              /*
              Text('gathrr', style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

               */
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
      ),
    );
  }
}
