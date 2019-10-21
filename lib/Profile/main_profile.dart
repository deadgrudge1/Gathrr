import 'package:flutter/material.dart';
import 'package:flutter_app/Data/Event.dart' as prefix0;
import 'package:flutter_app/Profile/edit_profile_screen.dart';
import 'package:flutter_app/Profile/setting_screen.dart';
import 'package:flutter_app/Profile/add_interests.dart';
import 'package:flutter_app/Profile/add_social_media.dart';
import 'package:flutter_app/Profile/edit_experience_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/util/utils.dart';
import 'package:flutter_app/util/rest.dart';
import 'package:flutter_app/Data/profile.dart' as prefix1;
import 'package:flutter/widgets.dart';
import 'dart:async';
import 'dart:io';

final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

class MainProfile extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.settings,
                color: Colors.white,),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.settings,
                color: Colors.white,),
              onPressed: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
          ],
        ),
        actions: <Widget>[
          new IconButton(
            icon: Icon(Icons.edit,
              color: Colors.white,),
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => EditScren()),
              );
            },
          ),
        ],
        title: Text("Profile",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue.shade900,
      ),
      body: ProfilePage("test", details),
    );
  }
}

var globalContext;
String name = "";
String username = "";
String description = "";
String designation = "";

List<String> company = ['loading'];
List<String> title = ['loading'];
List<String> startDate = ['loading'];
List<String> endDate = ['loading'];

List<String> expDescription = ['loading'];
var interests = ['loading'];
List<String> socialMediaLinks = ['loading'];
List<String> details = ['loading'];


bool isFetched = false;

class ProfilePage extends StatefulWidget {
  final String userName;
  List<String> details;

  ProfilePage(this.userName, this.details) : super();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  prefix0.Event event;
  prefix1.Profile profile_data;

  List<String> ids = ['loading'];
  List<String> company = ['loading'];
  List<String> title = ['loading'];
  List<String> startDate = ['loading'];
  List<String> endDate = ['loading'];
//String location = "";
  List<String> expDescription = ['loading'];
  var interests = ['loading', 'loading', 'loading'];
  List<String> socialMediaLinks = ['loading'];

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    print(details);
    getData(context);
    setState(() {
      name = "";
      description = "";
      designation = "";
    });
    event = new prefix0.Event();
    profile_data = new prefix1.Profile();

    //getData(context);
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    //await Future.delayed(Duration(seconds: 2));
    getData(context);
    print('TEST');
    await this.profile_data.getProfile();
    var details = this.profile_data.details;
    var interest_details = profile_data.interests;
    interests = List.generate(interest_details.length, (i) => interest_details[i]['user_interest']);
    print("intersts oiwdhc : " + interests.toString());
    //print("1st interest : " + interests[0].toString());
    print("dbscikbdc : " + details['name']);
    await event.getEvents();
    var pastEvents = event.pastEvents;
    print(pastEvents[0]);
    Map map = new Map<String, String>();
    map['get-profile'] = '1';
    var url = 'profile.php';
    Rest response = new Rest(url);
    String responseString = await response.getData(map);
    print("call : " + responseString);
    return null;
  }

  void getData(context) async {
    username = widget.userName;
    print("username : " + username);
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if (token != null) {
      String action = "get-profile";
      String value = "1";
      /*if (username.length >= 3) {
        action = "username";
        value = username;
      }*/
      String url = globals.url + "profile.php";
      http.post(url, body: {
        "token": token,
        action: value,
      }).then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error fetching data");
        }

        print(response.body);
        var responseArray = json.decode(response.body);

        var status = responseArray['status'];

        //print(responseArray);

        setState(() {
          if (status == true) {
            var payload = responseArray['payload'];

            var details = payload['details']; //user_id, name, bio, designation

            var experiences = payload['experiences'];
            //var experience = experiences[0];  //id, user_id, company, title, location, start_date, end_date(currently working if null)

            var interests = payload['interests'];
            //var interest = interests[0];  //id, user_id, interest

            print(responseArray['payload']['interests']);
            if(responseArray['payload']['details']['name'] != null)
            name = responseArray['payload']['details']['name'];

            if(responseArray['payload']['details']['bio'] != null)
            description = responseArray['payload']['details']['bio'];

            if(responseArray['payload']['details']['designation'] != null)
            designation = responseArray['payload']['details']['designation'];

          }
          else {
            name = "Username : " + username;
          }
          isFetched = true;

          if(responseArray['payload']['details']['name'] != null)
            name = responseArray['payload']['details']['name'];

          if(responseArray['payload']['details']['bio'] != null)
            description = responseArray['payload']['details']['bio'];

          if(responseArray['payload']['details']['designation'] != null)
            designation = responseArray['payload']['details']['designation'];
          company = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['company']);
          print("test : " + company.toString());
          title = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['title']);
          startDate = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['start_date']);
          endDate = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['end_date']);
          //expDescription = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['company']);
          interests = List.generate(responseArray['payload']['interests'].length, (i) => responseArray['payload']['interests'][i]['user_interest']);
          //socialMediaLinks = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['socialMediaLinks']);

          if(interests.length < 1)
            {
              //interests = ['loading', 'loading', 'loading'];
            }
        });

      });
    }
  }

  var interestListOne = ["AI", "Flutter", "Java "];
  //var interestListTwo = ["EVentTech", "Automation"];
  Screen size;
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    //if(!isFetched || name==null)
    //getData(context);
    size = Screen(MediaQuery.of(context).size);
    return RefreshIndicator(
        key: refreshKey,
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(32),
                        bottomLeft: Radius.circular(32)),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.blue.shade900, Colors.blue.shade400],
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                              border: new Border.all(
                                width: 1.5,
                                color: Colors.white,
                              ),
                              shape: BoxShape.circle,
                              ),
                          child: Icon(Icons.person,
                            size: 80,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 5.0),
                        child: Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0),
                        child: Text(designation,
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        child: new Container(
                          height: 1.5,
                          color: Colors.grey.shade200,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Column(
                    //scrollDirection: Axis.vertical,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: Container(
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Text(description),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: new Container(
                          height: 0.5,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0,),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                      child: Center(
                                        child: Text(
                                          'Experience',
                                          style: new TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: (){
                                          Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => EditExperience()),
                                          );
                                      },
                                      icon: Icon(Icons.edit,
                                        color: Colors.grey.shade700,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),

                                ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: company == null? 0 : company.length,
                                  itemBuilder: (context, i) => GestureDetector(
                                    onTap: (){},
                                    child: ListTile(
                                      leading: const Icon(Icons.supervised_user_circle),
                                      title: Text(
                                        title[i].toString() + " @ " + company[i].toString(),
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      subtitle: Row(
                                        children: <Widget>[
                                          Text(
                                            startDate[i].toString() +" to "+ endDate[i].toString(),
                                            style: new TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 0.0),
                        child: new Container(
                          height: 0.5,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      /*
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                      child: Center(
                                        child: Text(
                                          'Interests',
                                          style: new TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: (){
                                        Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => AddInterests()),
                                        );
                                      },
                                      icon: Icon(Icons.edit,
                                        size: 20.0,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                                /*
                                ListView.builder(
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: interests == null? 0 : interests.length,
                                  itemBuilder: (context, i) => GestureDetector(
                                    onTap: (){},
                                    child: ListTile(
                                      //leading: MyBullet(),
                                      title: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.only(right: 10.0),
                                            child: MyBullet(),
                                          ),
                                          Text(interests[i]),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Chip(
                                        label: Text(interests[0].toString()),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Chip(
                                        label: Text(interests[1].toString()),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Chip(
                                        label: Text(interests[2].toString()),
                                      ),
                                    ),
                                  ],
                                ),
                                 */
                              ],
                            ),
                          ),
                        ),
                      ),
                       */
                      Row(),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: new Container(
                          height: 0.5,
                          color: Colors.grey.shade200,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Container(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Column(
                              children: <Widget>[
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                                      child: Center(
                                        child: Text(
                                          'Social Media',
                                          style: new TextStyle(
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    IconButton(
                                      onPressed: (){
                                        Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => AddSocialMedia()),
                                        );
                                      },
                                      icon: Icon(Icons.edit,
                                        size: 20.0,
                                        color: Colors.grey.shade700,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        child: CircleAvatar(
                                          backgroundImage:
                                          AssetImage("images/facebook.png"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        child: CircleAvatar(
                                          backgroundImage:
                                          AssetImage("images/linkedin.png"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          backgroundImage: AssetImage("images/insta.png"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 45.0,
                                        height: 45.0,
                                        child: CircleAvatar(
                                          backgroundColor: Colors.transparent,
                                          backgroundImage:
                                          AssetImage("images/twitter.png"),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        onRefresh: refreshList);
  }

  Padding buildChoiceChip(index, chipName) {
    return Padding(
      padding: EdgeInsets.only(left: size.getWidthPx(5)),
      child: ChoiceChip(
        backgroundColor: Colors.grey.shade100,
        selectedColor: Colors.grey.shade100,
        labelStyle: TextStyle(
            fontFamily: 'Exo2',
            color: (_selectedIndex == index) ? Colors.black : Colors.black),
        elevation: 1.0,
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

Padding leftAlignText({text, leftPadding, textColor, fontSize, fontWeight}) {
  return Padding(
    padding: EdgeInsets.only(left: leftPadding),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(text ?? "",
          textAlign: TextAlign.left,
          style: TextStyle(
              fontFamily: 'Exo2',
              fontSize: fontSize,
              fontWeight: fontWeight ?? FontWeight.w500,
              color: textColor)),
    ),
  );
}

class MyBullet extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 7.0,
      width: 7.0,
      decoration: new BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }
}