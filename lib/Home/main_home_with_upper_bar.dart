import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/util/models.dart';
import 'package:flutter_app/widgets/tabs_chips.dart';
import 'package:flutter_app/Chat/chat_screen.dart';
import 'package:flutter_app/Notifications/notification_screen.dart';
import 'package:flutter_app/util/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/upper_curve_clipper.dart';
import 'package:flutter_app/widgets/boxfield.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  Screen size;
  int _selectedIndex = 1;

  List<Event> premiumList =  List();
  List<Event> featuredList =  List();
  var citiesList = ["Pune", "Mumbai", "Delhi ", "Bangalore","Goa","Kolkata","Indore","Jaipur"];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    premiumList
      ..add(Event(eventName:"Artificial Intelligence", eventLocation:"Pune ", image: "", eventArea:"Kothrud"))
      ..add(Event(eventName:"Social NETwork", eventLocation:"Pune ", image:"", eventArea:"Koregaon Park"))
      ..add(Event(eventName:"Modern UI", eventLocation:"Pune ", image:"", eventArea:"Kalyani Nagar"))
      ..add(Event(eventName:"Times Group", eventLocation:"Pune ", image:"", eventArea:"JM Road"))
      ..add(Event(eventName:"EventTECH", eventLocation:"Pune ", image:"", eventArea:"SB Road"))
      ..add(Event(eventName:"Panhala Trek", eventLocation:"Pune ", image:"", eventArea:"Kalyani Nagar"))
      ..add(Event(eventName:"The ComedyPrime", eventLocation:"Pune ", image:"", eventArea:"JM Road"))
      ..add(Event(eventName:"Smart City", eventLocation:"Pune ", image:"", eventArea:"Camp"))
      ..add(Event(eventName:"Modern UI", eventLocation:"Pune ", image:"", eventArea:"Koregaon Park"))
      ..add(Event(eventName:"The TEDx", eventLocation:"Pune", image:"", eventArea:"JW Mariott, SB.Road"));
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
            systemNavigationBarColor: Colors.blue),
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
            leftAlignText(
                  text: "Upcoming Events",
                  leftPadding: size.getWidthPx(16),
                  textColor: Colors.black,
                  fontSize: 26.0,
                  fontWeight: FontWeight.bold,
              ),
            HorizontalList(
                children: <Widget>[
                  for (int i = 0; i < premiumList.length; i++)
                    propertyCard(premiumList[i])
                ],
              ),
            leftAlignText(
                  text: "Your Past Events",
                  leftPadding: size.getWidthPx(16),
                  textColor: Colors.black,
                  fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            HorizontalList(
              children: <Widget>[
                for (int i = 0; i < premiumList.length; i++)
                  propertyCard(premiumList.reversed.toList()[i])

              ],
            )
          ],
        ),
      ],
    );
  }

  Card upperBoxCard() {
    return Card(
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
              /*
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

               */
              //_searchWidget(),
              /*
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
        ));
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

  Card propertyCard(Event property) {
    return Card(
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
                    child: Image.asset('assets/${property.image}',
                        fit: BoxFit.fill)),
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
            )));
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
