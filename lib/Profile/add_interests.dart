import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AddInterests extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          'interests',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: AddInterestsBody(),
    );
  }
}

class AddInterestsBody extends StatefulWidget {
  @override
  _AddInterestsBodyState createState() => _AddInterestsBodyState();
}

class _AddInterestsBodyState extends State<AddInterestsBody> {

  TextEditingController _textFieldControllerone = TextEditingController();
  TextEditingController _textFieldControllertwo = TextEditingController();
  TextEditingController _textFieldControllerthree = TextEditingController();

  var interests = ['flutter', 'artificial intelligence', 'dart'];
  var id;

  @override
  void initState() {
    super.initState();

    getData(context);
  }

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

        setState(() {

          //expDescription = List.generate(responseArray['payload']['experiences'].length, (i) => responseArray['payload']['experiences'][i]['company']);
          interests = List.generate(responseArray['payload']['interests'].length, (i) => responseArray['payload']['interests'][i]['user_interest']);
          id = List.generate(responseArray['payload']['interests'].length, (i) => responseArray['payload']['interests'][i]['id']);
          //socialMediaLinks = List.generate(responseArray['list'].length, (i) => responseArray['list'][i]['socialMediaLinks']);

        });

        //return true;
      });
    }
  }

  void updateData(context) async {

    //username = widget.userName;
    //print("username : " + username);
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if (token != null) {

      String url = globals.url + "profile.php";

          http.post(url, body: {
            "token": token,
            "update-interest": "1",
            "id":id[0],
            "updated-interest":_textFieldControllerone.text
          }).then((http.Response response) {
            final int statusCode = response.statusCode;

            if (statusCode < 200 || statusCode > 400 || json == null) {
              throw new Exception("Error fetching data");
            }

            print(response.body);
          });

      http.post(url, body: {
        "token": token,
        "update-interest": "1",
        "id":id[1],
        "updated-interest":_textFieldControllertwo.text
      }).then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error fetching data");
        }

        print(response.body);
      });

      http.post(url, body: {
        "token": token,
        "update-interest": "1",
        "id":id[2],
        "updated-interest":_textFieldControllerthree.text
      }).then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error fetching data");
        }

        print(response.body);
      });

      //return true;

    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: InputChip(
              avatar: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              label: TextField(
                controller: _textFieldControllerone,
                decoration: InputDecoration(hintText: interests[0]),
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            ),
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: InputChip(
            avatar: Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            label: TextField(
              controller: _textFieldControllertwo,
              decoration: InputDecoration(hintText: interests[1]),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: InputChip(
            avatar: Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            label: TextField(
              controller: _textFieldControllerthree,
              decoration: InputDecoration(hintText: interests[2]),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          ),
        ),
        GestureDetector(
          onTap: (){
              updateData(context);
          },
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
              child: Container(
                height: 45,
                width: MediaQuery.of(context).size.width/1.3,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue.shade400,
                        Colors.blue.shade400,
                      ],
                    ),
                    borderRadius: BorderRadius.all(
                        Radius.circular(50)
                    )
                ),
                child: Center(
                  child: Text('SAVE'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

