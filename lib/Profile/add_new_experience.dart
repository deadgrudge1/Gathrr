import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class AddNewExperience extends StatelessWidget {

  String id = "";
  String company = "";
  String title = "";
  String startDate = "";
  String endDate = "";
//String location = "";
  String expDescription = "";

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
          'experience',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: NewExpBody(),
    );
  }
}

class NewExpBody extends StatefulWidget {
  @override

  String company = "";
  String title = "";
  String startDate = "";
  String endDate = "";
//String location = "";
  String expDescription = "";
  String id = "";


  _NewExpBodyState createState() => _NewExpBodyState();
}

class _NewExpBodyState extends State<NewExpBody> {

  TextEditingController textFieldControllercompany = TextEditingController();
  TextEditingController textFieldControllertitle = TextEditingController();
  TextEditingController textFieldControllerstartDate = TextEditingController();
  TextEditingController textFieldControllerendDate = TextEditingController();

  void updateData(context) async {

    //username = widget.userName;
    //print("username : " + username);
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if (token != null) {

      String url = globals.url + "profile.php";

      print("id : " + widget.id);

      http.post(url, body: {
        "token": token,
        "add-experience": "1",
        //"id":widget.id,
        "company":textFieldControllercompany.text,
        "title":textFieldControllertitle.text,
        //"location":textFieldControllerlocation.text;
        "start_date":textFieldControllerstartDate.text,
        "end_date":textFieldControllerendDate.text
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
  void initState() {
    //textFieldControllercompany = TextEditingController(text: widget.company);
    //textFieldControllertitle = TextEditingController(text: widget.title);
    //textFieldControllerstartDate = TextEditingController(text: widget.startDate);
    //textFieldControllerendDate = TextEditingController(text: widget.endDate);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Flexible(
            child: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "company"
                    ),
                    //initialValue: widget.company,
                    controller: textFieldControllercompany,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "title"
                    ),
                    controller: textFieldControllertitle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    children: <Widget>[
                      Checkbox(
                        value: widget.endDate == null ? true : false,
                      ),
                      Text("I currently work in this role"),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        width: 150.0,
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "start date"
                          ),
                          controller: textFieldControllerstartDate,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Container(
                          width: 150.0,
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "end date"
                            ),
                            controller: textFieldControllerendDate,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "description",
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    updateData(context);
                    Scaffold
                        .of(context)
                        .showSnackBar(SnackBar
                      (content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Refresh profile to see changes",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                      backgroundColor: Colors.blueGrey,
                    ));
                    Future.delayed(const Duration(seconds: 2), () {
                      setState(() {
                        Navigator.of(context).pop();
                      });
                    });
                  },
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                      child: Container(
                        height: 45,
                        width: MediaQuery.of(context).size.width/1.2,
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
            ),
          ),
        ],
      ),
    );
  }
}

