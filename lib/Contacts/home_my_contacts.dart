import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_app/Profile/contact_profile.dart';
//import 'package:flutter_app/Profile/profile_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/util/data.dart';

var globalContacts;

class MyContacts extends StatefulWidget {

  @override
  _MyContactsState createState() => _MyContactsState();
}


class _MyContactsState extends State<MyContacts> {

  List<String> listUsername = new List<String>();
  List<String> listName = new List<String>();
  //var random;

  var refreshKey = GlobalKey<RefreshIndicatorState>();

  @override
  void initState() {
    super.initState();
    //random = Random();
    //refreshList();
    getData();
  }

  Future<Null> refreshList() async {
    refreshKey.currentState?.show(atTop: false);
    //await Future.delayed(Duration(seconds: 2));

    getData();

    /*setState(() {
      list = List.generate(random.nextInt(10), (i) => "Var Name $i");
    });*/

    return null;
  }

  void getData() async {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if(token!=null)
    {
      String url = globals.url + "contacts.php";
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
        //var status = responseArray['status'];
        //if(status == true) {
        setState(() {
          listName = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['name']);
          listUsername = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['email']);
        });
        //print(responseArray['list'][1]['username']);
        //print(responseArray['list'].length);

        for(var i=0; i<listName.length; i++)
        {
          if(listName[i] == null)
            listName[i] = "Username : " + listUsername[i];
        }
        print(listName);
        //return true;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    globalContacts = context;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
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
        centerTitle: true,
        title: Text("My Contacts",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        /*
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("images/gathrr_name.png"),
        ),

         */
      ),
      body: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              color: Colors.blue.shade50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Center(child: Text("Scanned QR codes of attendees will be",
                      style: TextStyle(
                        fontSize: 15.0
                      ),
                    )),
                    Center(child: Text("added here in the contacts list",
                      style: TextStyle(
                          fontSize: 15.0
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(10),
              separatorBuilder: (BuildContext context, int index) {
                return Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    height: 0.5,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Divider(),
                  ),
                );
              },
              itemCount: notifications.length,
              itemBuilder: (BuildContext context, int index) {
                Map notif = notifications[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 5.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        notif['dp'],
                      ),
                      radius: 25,
                    ),
                    contentPadding: EdgeInsets.all(0),
                    title: RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text: names[random.nextInt(10)].toString(),
                            style: TextStyle(
                              wordSpacing: 0.5,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,

                            ),
                          ),
                        ],
                      ),
                    ),
                    subtitle: Text(designations[random.nextInt(10)].toString()),
                    /*
                        Text(
                            names[random.nextInt(10)].toString() + " " + notification[random.nextInt(10)].toString(),
                        ),

                         */

                    //Flexible(child: Text(" " + notification[random.nextInt(10)].toString())),

                    //Text(notif['notif']),
                    onTap: (){

                    },
                  ),
                );
              },

            ),
          ),
        ],
      ),
      /*
      RefreshIndicator(
        key: refreshKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
            itemCount: listUsername == null? 0 : listUsername.length,//list?.length,
            itemBuilder: (context, i) => GestureDetector(
                child: ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    size: 50.0,
                    color: Colors.grey.shade300,
                  ),
                  contentPadding: EdgeInsets.all(0),
                  title: Text(listName[i],
                    style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  subtitle: Text('var designation'),
                ),
                onTap: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ContactProfile(listUsername[i])),
                  );
                },
              ),
          ),
        ),
        onRefresh: refreshList,
      ),

       */
    );
  }
}

/*
    return Scaffold(
      appBar: AppBar(
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
        centerTitle: true,
        title: Text('gathrr', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactProfile()),
                );
              },
              child: new Card(
                color: Colors.grey.shade200,
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Shreyas Hosmani', style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),),
                  subtitle: Text('Front-End Developer'),
                ),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Amit Chaudhari', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Back-End Developer'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Jeet Vithalani', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('UI/UX, Analytics'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Tony Stark', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Tech Savy, Iron Man'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Barry Allen', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Fastest Person'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Black Panther', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Vibranium Protector'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Captain America', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('First Avenger'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('The Thor', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Thunder God'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Captain Marvel', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Universe Protecter'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Shreyas Hosmani', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Front-End Developer'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Amit Chaudhari', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),


                subtitle: Text('Back-End Developer'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Jeet Vithalani', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('UI/UX, Analytics'),
              ),
            ),
          ],
        ),
      ),
    );

     */

