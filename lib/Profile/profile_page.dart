import 'package:flutter/material.dart';
import 'package:flutter_app/Profile/add_experience.dart';
import 'package:flutter_app/Profile/add_interests.dart';
import 'package:flutter_app/Profile/add_social_media.dart';
import 'package:flutter_app/Profile/edit_experience_list.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/util/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/widgets/upper_curve_clipper.dart';
import 'package:flutter_app/widgets/boxfield.dart';
import 'package:flutter_app/widgets/tabs_chips.dart';
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

var globalContext;
String name = "";
String username = "";
String description =
    "I am a flutter developer currently working at gathrr.in, as technical co-founder to build an end to end event management platform, which you're using currently!";

//var company = ["AI", "Flutter", "Java "];
//var title = ["EVentTech", "Automation"];
//var startDate = ["AI", "Flutter", "Java "];
//var endDate = ["EVentTech", "Automation"];
//var expDescription = ["AI", "Flutter", "Java "];

//var interests = ["Flutter", "Artificial Intelligence", "EventTech"];

//zvar socialMediaLinks = ["EVentTech", "Automation"];


bool isFetched = false;

class ProfilePage extends StatefulWidget {
  final String userName;

  ProfilePage(this.userName) : super();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  List<String> company = new List<String>();
  List<String> title = new List<String>();
  List<String> startDate = new List<String>();
  List<String> endDate = new List<String>();
//String location = "";
  List<String> expDescription = new List<String>();
  List<String> interests = new List<String>();
  List<String> socialMediaLinks = new List<String>();

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    setState(() {
      name = "";
    });
    getData(context);
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    //await Future.delayed(Duration(seconds: 2));

    getData(context);

    /*setState(() {
      list = List.generate(random.nextInt(10), (i) => "Var Name $i");
    });*/

    return null;
  }

  void getData(context) async {
    username = widget.userName;
    print("username : " + username);
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if (token != null) {
      String action = "profile";
      String value = "1";
      if (username.length >= 3) {
        action = "username";
        value = username;
      }
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

        setState(() {
          if (status == true)
            name = responseArray['name'];
          else
            name = "Username : " + username;
          isFetched = true;

          company = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['company']);
          title = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['title']);
          startDate = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['startDate']);
          endDate = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['endDate']);
          expDescription = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['expDescription']);
          interests = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['interests']);
          socialMediaLinks = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['socialMediaLinks']);

        });

        //return true;
      });
    }
  }

  var interestListOne = ["AI", "Flutter", "Java "];
  var interestListTwo = ["EVentTech", "Automation"];
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
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(
                                      "https://qph.fs.quoracdn.net/main-raw-226477733-zskxlexzsxfiubrenlkcrywxnrzoswrk.jpeg"))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25),
                        child: Text(
                          "ID: 14552566",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 25, bottom: 25),
                        child: Text(
                          name,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold),
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
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(description),
                            )),
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
                                    itemCount: company == null? 0 : company.length,
                                  itemBuilder: (context, i) => GestureDetector(
                                    child: ListTile(
                                      leading: const Icon(Icons.supervised_user_circle),
                                      title: Text(
                                        company[i],
                                        style: new TextStyle(
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      subtitle: Row(
                                        children: <Widget>[
                                          Text(
                                            startDate[i],
                                            style: new TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          ),
                                          Text(
                                            endDate[i],
                                            style: new TextStyle(
                                              fontSize: 13.0,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    onTap: (){

                                    },
                                  ),
                                ),
                                /*
                                ListTile(
                                  leading: const Icon(Icons.supervised_user_circle),
                                  title: Text(
                                    'Tecnical Co-Founder @gathrr.in',
                                    style: new TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(
                                        'Present - 2 months',
                                        style: new TextStyle(
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.supervised_user_circle),
                                  title: Text(
                                    'Flutter Developer @Spaising Technologies',
                                    style: new TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(
                                        'Jan 2019 - May 2019',
                                        style: new TextStyle(
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ListTile(
                                  leading: const Icon(Icons.supervised_user_circle),
                                  title: Text(
                                    'Student at SKNCOE',
                                    style: new TextStyle(
                                      fontSize: 15.0,
                                    ),
                                  ),
                                  subtitle: Row(
                                    children: <Widget>[
                                      Text(
                                        '2015 - 2019',
                                        style: new TextStyle(
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),


                                 */
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
                                Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Chip(
                                        label: Text(interests[0]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Chip(
                                        label: Text(interests[1]),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Chip(
                                        label: Text(interests[2]),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(),
                      /*
                      Row(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "#",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 15.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 8.0, 8.0, 8.0),
                                child: Text(
                                  "Artificial Intelligence",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "#",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 15.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 8.0, 8.0, 8.0),
                                child: Text(
                                  "Flutter",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Text(
                                "#",
                                style: TextStyle(
                                    color: Colors.blue, fontSize: 15.0),
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    0.0, 8.0, 8.0, 8.0),
                                child: Text(
                                  "Dart",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 15.0),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                       */
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

                /*
        Container(
          height: MediaQuery.of(context).size.height/3,
          padding: EdgeInsets.all(50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.account_box, color: Colors.grey,),
                        Text('Friends',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.center_focus_strong, color: Colors.grey,),
                        Text('Scan Now',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.chat_bubble, color: Colors.grey,),
                        Text('My-Chats',
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.aspect_ratio, color: Colors.grey,),
                        Text('My-QR',style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.settings, color: Colors.grey,),
                        Text('My-Settings',style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.visibility, color: Colors.grey,),
                        Text('Visitors',style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),*/
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
