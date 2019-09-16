import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/Home/all_past_events.dart';
import 'package:flutter_app/Home/all_upcoming_events.dart';
import 'package:flutter_app/Home/current.dart';
import 'package:flutter_app/Home/ongoing_event_page.dart';
import 'package:flutter_app/Home/ongoing_members.dart';
import 'package:flutter_app/Home/ongoing_notifications.dart';
import 'package:flutter_app/Home/upcoming_event_page.dart';
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

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Screen size;
  int _selectedIndex = 1;

  List<Event> premiumList =  List();
  List<Event> featuredList =  List();
  List reversedList = List();

  var citiesList = ["Pune", "Mumbai", "Delhi ", "Bangalore","Goa","Kolkata","Indore","Jaipur"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //premiumList.add(Event(eventName: "NO UPCOMING EVENTS"));
    //featuredList.add(Event(eventName: "NO PAST EVENTS"));

    //getData();

    premiumList
      ..add(Event(eventName:"Artificial Intelligence", eventLocation:"Pune ", image: "bookingapp.png", eventArea:"Kothrud"))
      ..add(Event(eventName:"Social NETwork", eventLocation:"Pune ", image:"upcoming_sample.png", eventArea:"Koregaon Park"))
      ..add(Event(eventName:"Modern UI", eventLocation:"Pune ", image:"", eventArea:"Kalyani Nagar"))
      ..add(Event(eventName:"Times Group", eventLocation:"Pune ", image:"", eventArea:"JM Road"))
      ..add(Event(eventName:"EventTECH", eventLocation:"Pune ", image:"", eventArea:"SB Road"))
      ..add(Event(eventName:"Panhala Trek", eventLocation:"Pune ", image:"", eventArea:"Kalyani Nagar"))
      ..add(Event(eventName:"The ComedyPrime", eventLocation:"Pune ", image:"", eventArea:"JM Road"))
      ..add(Event(eventName:"Smart City", eventLocation:"Pune ", image:"", eventArea:"Camp"))
      ..add(Event(eventName:"Modern UI", eventLocation:"Pune ", image:"event_2.jpg", eventArea:"Koregaon Park"))
      ..add(Event(eventName:"The TEDx", eventLocation:"Pune", image:"event_3ted.jpg", eventArea:"JW Mariott, SB.Road"));

    reversedList = premiumList.reversed.toList();

  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if(token!=null)
    {
      String url = globals.url + "events.php";
      http.post(url, body: {
        "token" : token,
      })
          .then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error fetching data");
        }

        print(response.body);
        var responseArray = json.decode(response.body);

        //print("UPCOMING"+responseArray['upcoming']);
        //print("PAST"+responseArray['past']);

        //var status = responseArray['status'];
        //if(status == true) {
        setState(() {
          for(var i=0; i<responseArray.length; i++)
            {

              if(responseArray['past']!=null) {
                featuredList =  List();
                featuredList.add(Event(id: responseArray['past'][i]['event_id'],
                    eventName: responseArray['past'][i]['title'],
                    eventLocation: responseArray['past'][i]['location']));
              }

                if(responseArray['upcoming']!=null) {
                  premiumList =  List();
                    premiumList.add(Event(id: responseArray['upcoming'][i]['event_id'],
                        eventName: responseArray['upcoming'][i]['title'],
                        eventLocation: responseArray['upcoming'][i]['location']));
                  }


            }

        });

        //print(eventStartDate);
        //print(eventStartTime);
        //print(responseArray['list'][1]['username']);
        //print(responseArray['list'].length);

        /*
        for(var i=0; i<listName.length; i++)
        {
          if(listName[i] == null)
            listName[i] = "Username : " + listUsername[i];
        }
        print(listName);

         */
        //return true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //getting the size of screen here...
    size = Screen(MediaQuery.of(context).size);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(const IconData(0xe901, fontFamily: 'pro'),
              color: Colors.white,),
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => EventNotices()),
              );
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: new Icon(const IconData(0xe909, fontFamily: 'pro'),
                color: Colors.white,),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ChatScreen()),
                );
              },
            ),
          ],
          //backgroundColor: Colors.blue.shade900,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade500
                ],
              ),
            ),
          ),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("images/gathrr_name.png",
            scale: 1.0,
            ),
          ),
        ),
      backgroundColor: Colors.white,
      body: AnnotatedRegion(
        value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark,
            systemNavigationBarIconBrightness: Brightness.dark,
            systemNavigationBarColor: Colors.blue.shade500),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[upperPart()],
            ),
          ),
        ),
      ),
    );
  }

  Widget upperPart() {
    return Stack(
      children: <Widget>[
        ClipPath(
          clipper: UpperClipper(),
          child: Container(
            height: size.getWidthPx(240),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade500
                ],
              ),
            ),
          ),
        ),
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(top: size.getWidthPx(36)),
              child: Column(
                children: <Widget>[
                  /*
                  Image.asset("images/gathrr_name.png",
                    scale: 8.0,
                  ),

                   */
                  //titleWidget(),
                  SizedBox(height: size.getWidthPx(10)),
                  upperBoxCard(),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                leftAlignText(
                  text: "Upcoming Events",
                  leftPadding: size.getWidthPx(16),
                  textColor: Colors.black,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllUpcoming()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text("see more",
                      style: TextStyle(
                          color: Colors.blue//.shade700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: HorizontalList(
                  children: <Widget>[
                    for (int i = 0; i < premiumList.length; i++)
                      propertyCard(premiumList[i])
                  ],
                ),
            ),
            Row(
              children: <Widget>[
                leftAlignText(
                  text: "Your Past Events",
                  leftPadding: size.getWidthPx(16),
                  textColor: Colors.black,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AllPast()),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text("see more",
                      style: TextStyle(
                        color: Colors.blue//.shade700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: HorizontalList(
                children: <Widget>[
                  for (int i = 0; i < reversedList.length; i++)
                    propertyCard(reversedList[i])
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  Stack upperBoxCard() {
    return Stack(
      children: <Widget>[
        Card(
        elevation: 4.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: EdgeInsets.symmetric(
            horizontal: size.getWidthPx(20), vertical: size.getWidthPx(16)),
        borderOnForeground: true,
        child: Container(
          width: size.getWidthPx(300),
          height: size.getWidthPx(150),
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        child: FlutterLogo(),
                        height: size.getWidthPx(150),
                        width: 150.0,
                        decoration: new BoxDecoration(
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text("Flutter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      Text("Workshop",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                      Text("Pune"),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0),
                        child: Row(
                          children: <Widget>[
                            Text("Time Till Live :",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Text("12:38 mins",
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              /*
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text("ongoing event".toUpperCase(),
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Center(child: Text("Details",
                style: TextStyle(
                  fontSize: 13.0
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text("no ongoing event",
                  style: TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Text("please scan to see the ongoing event details",
                    style: TextStyle(
                      fontSize: 13.0,
                    ),
                ),
              ),


              //_searchWidget(),

              Padding(
                padding: EdgeInsets.only(top: 25.0),
                child: leftAlignText(
                    text: "Top Cities :",
                    leftPadding: size.getWidthPx(16),
                    textColor: Colors.black,
                    fontSize: 16.0),
              ),
              HorizontalList(
                children: <Widget>[
                  for(int i=0;i<citiesList.length;i++)
                    buildChoiceChip(i, citiesList[i])
                ],
              ),

               */
            ],
          ),
        ),),
        Padding(
          padding: const EdgeInsets.only(top: 150.0, bottom: 10.0, left: 190.0),
          child: FloatingActionButton(
            //elevation: 0,
            heroTag: null,
            backgroundColor: Colors.white,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => OngoingMembers()),
              );
            },//showNotification,
            //color: Colors.blue.shade300,
            child: Icon(Icons.people,
              color: Colors.black,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 150.0, bottom: 10.0, left: 250.0),
          child: FloatingActionButton(
            //elevation: 0,
            heroTag: null,
            backgroundColor: Colors.white,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => OngoingNotifications()),
              );
            },//showNotification,
            //color: Colors.blue.shade300,
            child: Icon(Icons.notifications_active,
              color: Colors.black,
            ),
          ),
        ),
      ],
    );
  }

  BoxField _searchWidget() {
    return BoxField(
        controller: TextEditingController(),
        focusNode: FocusNode(),
        hintText: "Select by city, area or locality.",
        lableText: "Search...",
        obscureText: false,
        onSaved: (String val) {},
        icon: Icons.search,
        iconColor: Colors.blue);
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

  GestureDetector propertyCard(Event property) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder: (context) => EventNow()),
        );
      },
      child: Card(
          elevation: 4.0,
          margin: EdgeInsets.all(8),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          borderOnForeground: true,
          child: Container(
              height: size.getWidthPx(150),
              width: size.getWidthPx(170),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12.0),
                          topRight: Radius.circular(12.0)),
                      child: Container(
                        height: 100.0,
                        child: Image.asset(
                            'assets/${property.image}',
                            fit: BoxFit.fill,
                        ),
                      ),
                  ),
                  SizedBox(height: size.getWidthPx(8)),
                  leftAlignText(
                      text: property.eventName,
                      leftPadding: size.getWidthPx(8),
                      textColor: Colors.black,
                      fontSize: 14.0,
                      fontWeight: FontWeight.w800,
                  ),
                  SizedBox(height: size.getWidthPx(4)),
                  leftAlignText(
                    text: property.eventArea,
                    leftPadding: size.getWidthPx(8),
                    textColor: Colors.black,
                    fontSize: 13.0,
                    //fontWeight: FontWeight.w800),
                  ),
                  leftAlignText(
                      text: property.eventLocation,
                      leftPadding: size.getWidthPx(8),
                      textColor: Colors.black54,
                      fontSize: 12.0),
                ],
              ))),
    );
  }

  Padding buildChoiceChip(index, chipName) {
    return Padding(
      padding: EdgeInsets.only(left: size.getWidthPx(8)),
      child: ChoiceChip(
        backgroundColor: Colors.white,
        selectedColor: Colors.blue,
        labelStyle: TextStyle(
            fontFamily: 'Exo2',
            color:
            (_selectedIndex == index) ? Colors.white : Colors.black),
        elevation: 4.0,
        padding: EdgeInsets.symmetric(
            vertical: size.getWidthPx(4), horizontal: size.getWidthPx(12)),
        selected: (_selectedIndex == index) ? true : false,
        label: Text(chipName),
        onSelected: (selected) {
          if (selected) {
            setState(() {
              _selectedIndex = index;
            });
          }
        },
      ),
    );
  }
}




/*
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

 */
