import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:flutter_app/main.dart';
import 'package:path/path.dart';
import 'home_page.dart';
import 'signup.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';


class CustomLoginForm extends StatefulWidget {
  @override
  _CustomLoginFormState createState() => _CustomLoginFormState();
}

/*class _LoginData{

   String email;
   String password;

  _LoginData({this.email, this.password});


}*/

var _usernameController = new TextEditingController();
var _passwordController = new TextEditingController();
//the class for posting receiving http requests and responses: STARTS HERE...................

Future<String> getData(context) async{
  String url = globals.url + "login.php";
  var token;
  var responseArray;
  final prefs = await SharedPreferences.getInstance();
  //final response = await


  http.post(url, body: {
    "email" : _usernameController.text,
    "password" : _passwordController.text,
  })
      .then((http.Response response) {
    final int statusCode = response.statusCode;

    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error fetching data");
    }

    _passwordController.text = "";

    responseArray = json.decode(response.body);

    var status = responseArray['status'];
    if(status == true) {
      token = responseArray['token'];


      prefs.setString("token", token);
      print("Token saved!" + token);

      Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      print('test1');
      /*var title = "Home";

      runApp(new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: new HomePage(

        ),
      ));*/
      print('test2');
      return true;
    }



    var msg = responseArray['msg'];
    print(msg);  //create toast/snackbar
  }
  );





  /*
    return response.body;

    String id;
    String err_response;
    try {
      id = json.decode(response.body);
      if(int.parse(id) > 0)
      {
        globals.id = int.parse(id);
        final snackBar = new SnackBar(content: new Text('ID : $id', style: new TextStyle(color: Colors.black, fontSize: 25),textAlign: TextAlign.center,),
          backgroundColor: Theme.of(context).backgroundColor,);
        Scaffold.of(context).showSnackBar(snackBar);
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => HomePage()));
      }
    }catch(Exception){err_response = json.decode(response.body);
    final snackBar = new SnackBar(content: new Text('Error $err_response', style: new TextStyle(color: Colors.black, fontSize: 25),textAlign: TextAlign.center,),
      backgroundColor: Theme.of(context).backgroundColor,);
    Scaffold.of(context).showSnackBar(snackBar);
    }
  }*/

}



void isLoggedIn() async {
  var token;
  var responseArray;
  final prefs = await SharedPreferences.getInstance();
  token = prefs.get("token");
  if(token != null) {
    print("It worked! " + token);
    String url = globals.url + "login.php";
    http.post(url, body: {
      "token" : token,
    })
        .then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error fetching data");
      }

      responseArray = json.decode(response.body);

      var status = responseArray['status'];
      if(status == true) {
        var msg = responseArray['msg'];
        print(msg);

        var title = "Home";
        runApp(new MaterialApp(
          debugShowCheckedModeBanner: false,
          title: title,
          home: new HomePage(

          ),
        ));
        //return true;

      }
      else {
        var msg = responseArray['msg'];
        print(msg);
        //return false;
      }
    });

    /*Navigator.push(context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );*/

  }
}


//the class for posting receiving http requests and responses: ENDS HERE ....................

class _CustomLoginFormState extends State<CustomLoginForm> {

  //_LoginData _data = new _LoginData();

  FocusNode _focusNode = new FocusNode();

  @override
  void initState(){
    super.initState();
    _focusNode.addListener(_focusNodeListener);
    isLoggedIn();
  }

  @override
  void dispose(){
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
  }

  Future<Null> _focusNodeListener() async {
    if (_focusNode.hasFocus){
      print('TextField got the focus');
    } else {
      print('TextField lost the focus');
    }
  }

  final _formKey = GlobalKey<FormState>();

  final image = new Image.asset("images/gathrrimg.png");

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Center(
              child: Image.asset("images/gathrrimg.png", scale: 7,),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 45,
              padding: EdgeInsets.only(
                  top: 4,left: 16, right: 16, bottom: 4
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5
                    )
                  ]
              ),
              child: TextFormField(
                controller: _usernameController,
                focusNode: _focusNode,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: Icon(Icons.email,
                      color: Colors.grey,
                    ),
                    hintText: "Email"
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please enter your name";
                  }else{
                    //_data.email = value;
                    //print("Data: ${_data.email}");
                  }
                },
              ),
            ),
          ),
          Center(
            child: Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 45,
              margin: EdgeInsets.only(top: 32),
              padding: EdgeInsets.only(
                  top: 4,left: 16, right: 16, bottom: 4
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5
                    )
                  ]
              ),
              child: TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key,
                    color: Colors.grey,
                  ),
                  hintText: 'Password',
                ),
                validator: (value){
                  if(value.isEmpty){
                    return "Please enter a password";
                  }else{
                    //_data.email = value;
                    //print("Data: ${_data.email}");
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 54
                    ),
                    child: Text('Forgot Password ?',
                      style: TextStyle(
                          color: Colors.grey
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 54
                    ),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()),
                        );
                      },
                      child: Text('New User? Sign Up',
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: (){
              getData(context);
              /*Navigator.push(context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );*/
            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.shade500,
                          Colors.blue.shade500,
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(50)
                      )
                  ),
                  child: Center(
                    child: Text('Login'.toUpperCase(),
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
