import 'package:flutter/material.dart';
import 'package:flutter_app/Profile/image_picker_widget.dart';
import 'package:flutter_app/Profile/main_profile.dart' as prefix0;
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class EditScren extends StatelessWidget {
  //String name, bio, designation;
  //EditScren(this.name, this.bio, this.designation) : super();

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
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: CreateEditBody(),
    );
  }
}

class CreateEditBody extends StatefulWidget {
  @override
  _CreateEditBodyState createState() => _CreateEditBodyState();

}

class _CreateEditBodyState extends State<CreateEditBody> {

  var id;
  TextEditingController _textFieldControllerName = TextEditingController();
  TextEditingController _textFieldControllerDescription = TextEditingController();
  TextEditingController _textFieldControllerDesignation = TextEditingController();

  void updateData(context) async {

    //username = widget.userName;
    //print("username : " + username);
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if (token != null) {

      print("id : " + _textFieldControllerName.text);

      String url = globals.url + "profile.php";

      http.post(url, body: {
        "token": token,
        "update-profile": "1",
        //"id":id[],
        "name":_textFieldControllerName.text,
        "bio":_textFieldControllerDescription.text,
        "designation":_textFieldControllerDesignation.text,
        //"updated-interest":_textFieldControllerone.text
      }).then((http.Response response) {
        final int statusCode = response.statusCode;

        if (statusCode < 200 || statusCode > 400 || json == null) {
          throw new Exception("Error fetching data");
        }

        print(response.body);
      });


    }
  }

  @override
  void initState() {
    
    _textFieldControllerName = TextEditingController(text: prefix0.name);
    _textFieldControllerDesignation = TextEditingController(text: prefix0.designation);
    _textFieldControllerDescription = TextEditingController(text: prefix0.description);

    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: ImagePickerGetter(),
              ),
            ],
          ),
          ListTile(
            title: TextFormField(
              controller: _textFieldControllerName,
              //initialValue: prefix0.name,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ListTile(
              title: Container(
                margin: EdgeInsets.only(top: 15.0),
                height: 130.0,
                padding: EdgeInsets.only(bottom: 20.0),
                child: TextFormField(
                  controller: _textFieldControllerDescription,
                  //initialValue: prefix0.description,
                  maxLines: 99,
                  decoration: InputDecoration(
                    //hintText: prefix0.description,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: const Divider(
              height: 1.0,
            ),
          ),
          ListTile(
            title: TextFormField(
              controller: _textFieldControllerDesignation,
              //initialValue: prefix0.designation,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
            child: const Divider(
              height: 1.0,
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
      ),
    );
  }
}
