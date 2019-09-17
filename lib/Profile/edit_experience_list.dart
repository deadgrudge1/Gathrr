import 'package:flutter/material.dart';
import 'package:flutter_app/Profile/add_experience.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class EditExperience extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.blue.shade900, Colors.blue.shade500],
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          'experience',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: EditExpBody(),
    );
  }
}

class EditExpBody extends StatefulWidget {
  @override

  _EditExpBodyState createState() => _EditExpBodyState();
}

class _EditExpBodyState extends State<EditExpBody> {

  List<String> ids = new List<String>();
  List<String> company = ["Company 1", "Company 2", "Company 3"];
  List<String> title = ["Title 1", "Title 2", "Title 3"];
  List<String> startDate = [""];
  List<String> endDate = [""];
//String location = "";
  List<String> expDescription = ["Some Description"];

  void getData(context) async {

    //username = widget.userName;
    //print("username : " + username);
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if (token != null) {
      String action = "get-profile";
      String value = "1";

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

          company = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['company']);
          print("test : " + company.toString());
          title = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['title']);
          startDate = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['start_date']);
          endDate = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['end_date']);
          //expDescription = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['company']);
          //interests = List.generate(responseArray['payload']['interests'].length, (i) => responseArray['payload']['interests'][i]['user_interest']);
          //socialMediaLinks = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['socialMediaLinks']);
          ids = List.generate(responseArray['payload']['interests'].length, (i) => responseArray['payload']['experiences'][i]['id']);

        });

        //return true;
      });
    }
  }

  @override
  void initState() {
    super.initState();

    getData(context);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: ScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: company == null? 0 : company.length,
      itemBuilder: (context, i) => GestureDetector(
        onTap: (){
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => AddExperience(ids[i].toString(), company[i].toString(), title[i].toString(), startDate[i].toString(), endDate[i])),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: const Icon(Icons.supervised_user_circle),
              title: Text(
                title[i].toString() + "@" + company[i].toString(),
                style: new TextStyle(
                  fontSize: 15.0,
                ),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    startDate[i].toString() +"-"+ endDate[i].toString(),
                    style: new TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
      /*
      ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: const Icon(Icons.supervised_user_circle),
              title: Text(
                company[0].toString(),
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
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddExperience(ids[0].toString(), company[0].toString(), title[0].toString(), startDate[0].toString(), endDate[0])),
                      );
                    },
                    icon: Icon(Icons.edit,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            color: Colors.white,
            child: ListTile(
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
                  Spacer(),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.edit,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            color: Colors.white,
            child: ListTile(
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
                  Spacer(),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.edit,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );

       */
  }
}

