import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

var globalContext;
String name = "";
String username = "";
String description = "I am a flutter developer currently working at gathrr.in, as technical co-founder to build an end to end event management platform, which you're using currently!";
bool isFetched = false;

class ProfilePage extends StatefulWidget {
  final String userName;
  ProfilePage(this.userName) : super();
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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

  void getData(context) async
  {
    username = widget.userName;
    print("username : " + username);
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if(token!=null)
    {
      String action = "profile";
      String value = "1";
      if(username.length >= 3)
        {
          action = "username";
          value = username;
        }
      String url = globals.url + "profile.php";
      http.post(url, body: {
        "token" : token,
        action : value,
      })
          .then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error fetching data");
        }

        print(response.body);
        var responseArray = json.decode(response.body);

        var status = responseArray['status'];

          setState(() {
            if(status == true)
              name = responseArray['name'];
            else
              name = "Username : " + username;
            isFetched = true;
          });

        //return true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //if(!isFetched || name==null)
      //getData(context);
    return RefreshIndicator(key: refreshKey,
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
                bottomLeft: Radius.circular(32)
            ),
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade400
              ],
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
                          image: NetworkImage("https://f6s-public.s3.amazonaws.com/profiles/1970927_th1.jpg")
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Text("ID: 14552566",
                  style: TextStyle(
                      color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25, bottom: 25),
                child: Text(name,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold
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
          padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
          child: Column(
            //scrollDirection: Axis.vertical,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                    description),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: new Container(
                  height: 1.5,
                  color: Colors.grey.shade200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Center(
                  child: Text(
                    'Experience',
                    style: new TextStyle(
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.supervised_user_circle),
                title: Text('Tecnical Co-Founder @gathrr.in',
                  style: new TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                subtitle: Text('Present - 2 months',
                  style: new TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.supervised_user_circle),
                title: Text('Flutter Developer @Spaising Technologies',
                  style: new TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                subtitle: Text('Jan 2019 - May 2019',
                  style: new TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.supervised_user_circle),
                title: Text('Student at SKNCOE',
                  style: new TextStyle(
                    fontSize: 15.0,
                  ),
                ),
                subtitle: Text('2015 - 2019',
                  style: new TextStyle(
                    fontSize: 13.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: new Container(
                  height: 1.5,
                  color: Colors.grey.shade200,
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

}

