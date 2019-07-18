import 'package:flutter/material.dart';
import 'package:flutter_app/ui/upcoming_event_page.dart';
import 'package:flutter_app/globals.dart' as globals;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Next extends StatefulWidget {
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {

  List<String> eventTitle = new List<String>();
  List<String> eventDate = new List<String>();

  //List<String> listUsername = new List<String>();
  //List<String> listName = new List<String>();

  var refreshKey = GlobalKey<RefreshIndicatorState>();

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
        //var status = responseArray['status'];
        //if(status == true) {
        setState(() {
          eventDate = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['eventDate']);
          eventTitle = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['eventTitle']);
        });
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
    return RefreshIndicator(
      key: refreshKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: eventTitle == null? 0 : eventTitle.length,//list?.length,
          itemBuilder: (context, i) => Card(
            child: GestureDetector(
              child: Column(
                children: <Widget>[
                  new Icon(Icons.image,
                    size: 150,
                    color: Colors.blueGrey,),
                  ListTile(
                    leading: const Icon(Icons.album),
                    title: Text(eventTitle[i], style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),),
                    subtitle: Text(eventDate[i]),
                  ),
                ],
              ),
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Ongoing()),
                );
              },
            ),
          ),
        ),
      ),
      onRefresh: refreshList,
    );
      /*
      RefreshIndicator(
      onRefresh: refreshList,
      key: refreshKey,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Ongoing()),
                );
              },
              child: new Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Column(
                      children: <Widget>[
                        new Icon(Icons.image,
                          size: 150,
                          color: Colors.blueGrey,),
                        ListTile(
                          leading: const Icon(Icons.album),
                          title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                          ),),
                          subtitle: Text(name),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

       */
  }
}
