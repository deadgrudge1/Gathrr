import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:flutter_app/Home/main_home_with_upper_bar.dart';
import 'package:flutter_app/Login/forgot_password_screen.dart';
import 'package:flutter_app/main.dart';
import 'package:path/path.dart';
import 'package:flutter_app/Main/home_page.dart';
import 'package:flutter_app/Signup/signup.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

BuildContext context;
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();



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

Future<String> getData(context) async {
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



_isLoggedIn() async {

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
  final FirebaseMessaging _messaging = FirebaseMessaging();

  FocusNode _focusNode = new FocusNode();

  final Firestore _db = Firestore.instance;
  final FirebaseMessaging _fcm = FirebaseMessaging();

  StreamSubscription iosSubscription;

  _onTapSignUp(BuildContext context, var response) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
      child: Container(
        height: 300.0,
        width: 300.0,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text('', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text(response, style: TextStyle(color: Colors.black),),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            },
                child: Text('Discard', style: TextStyle(color: Colors.black, fontSize: 18.0),))
          ],
        ),
      ),
    );
  }

  void showNotification(var message) async
  {
    print("in test");
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.High,importance: Importance.Max
    );
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, message['data']['title'], message['data']['body'], platform,
        payload: 'Please check the ongoing event list for a new card!');
    print("after test");
  }



  @override
  void initState(){
    super.initState();
    fcmSubscribe();
    _focusNode.addListener(_focusNodeListener);
    _isLoggedIn();
    _messaging.getToken().then((token) {
      print(token);
    });
    _fcm.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessageb: $message");
        print("login");

        showNotification(message);
        //show notification only

        /*
         final snackbar = SnackBar(
           content: Text(message['notification']['title']),
           action: SnackBarAction(
             label: 'Go',
             onPressed: () => null,
           ),
         );

        Scaffold.of(context).showSnackBar(snackbar);
        setState(() {
          showDialog(context: context,builder: (context) => _onTapSignUp(context, message.toString()));
        });

         */
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            content: ListTile(
              title: Text(message['notification']['title']),
              subtitle: Text(message['notification']['body']),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.amber,
                child: Text('Ok'),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        );

      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
        showNotification(message);
        //open route to user chat using user email_id

        // TODO optional
        setState(() {
          showDialog(context: context,builder: (context) => _onTapSignUp(context, message.toString()));
        });
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
        //showNotification(message);
        //open route to user chat using user email_id

        print("minimized opened now");
        // TODO optional
        setState(() {
          showDialog(context: context,builder: (context) => _onTapSignUp(context, message.toString()));
        });
      },
    );
  }

  FirebaseMessaging firebaseMessaging = new FirebaseMessaging();

  void fcmSubscribe() {
    firebaseMessaging.subscribeToTopic('TopicToListen');
  }

  @override
  void dispose(){
    _focusNode.removeListener(_focusNodeListener);
    super.dispose();
    fcmSubscribe();
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

  final GoogleSignIn googleSignIn = GoogleSignIn();
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  SharedPreferences prefs;

  bool isLoading = false;
  bool isLoggedIn = false;
  FirebaseUser currentUser;

  Future<Null> handleSignIn() async {
    prefs = await SharedPreferences.getInstance();

    this.setState(() {
      isLoading = true;
    });

    GoogleSignInAccount googleUser = await googleSignIn.signIn();
    GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    FirebaseUser firebaseUser = await firebaseAuth.signInWithCredential(credential);

    if (firebaseUser != null) {
      // Check is already sign up
      final QuerySnapshot result =
      await Firestore.instance.collection('users').where('id', isEqualTo: firebaseUser.uid).getDocuments();
      final List<DocumentSnapshot> documents = result.documents;
      if (documents.length == 0) {
        // Update data to server if new user
        Firestore.instance.collection('users').document(firebaseUser.uid).setData({
          'nickname': firebaseUser.displayName,
          'photoUrl': firebaseUser.photoUrl,
          'id': firebaseUser.uid,
          'createdAt': DateTime.now().millisecondsSinceEpoch.toString(),
          'chattingWith': null
        });

        // Write data to local
        currentUser = firebaseUser;
        await prefs.setString('id', currentUser.uid);
        await prefs.setString('nickname', currentUser.displayName);
        await prefs.setString('photoUrl', currentUser.photoUrl);
      } else {
        // Write data to local
        await prefs.setString('id', documents[0]['id']);
        await prefs.setString('nickname', documents[0]['nickname']);
        await prefs.setString('photoUrl', documents[0]['photoUrl']);
        await prefs.setString('aboutMe', documents[0]['aboutMe']);
      }
      Fluttertoast.showToast(msg: "Sign in success");
      this.setState(() {
        isLoading = false;
      });

      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(currentUserId: firebaseUser.uid)));
    } else {
      Fluttertoast.showToast(msg: "Sign in fail");
      this.setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Center(
              child: Image.asset("images/gathrrimg.png", scale: 10,),
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
                    Scaffold
                        .of(context)
                        .showSnackBar(SnackBar
                      (content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Email field is empty",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                      backgroundColor: Colors.blue,
                    ));
                  }else{
                    return null;
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
                    Scaffold
                        .of(context)
                        .showSnackBar(SnackBar
                      (content: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Password field is empty",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                      backgroundColor: Colors.blue,
                    ));
                  }else{
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
//             // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ForgotPassword()),
                    );
                  },
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 16, left: 30
                      ),
                      child: Text('Forgot Password ?',
                        style: TextStyle(
                            color: Colors.grey
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 58,),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 16, left: 30
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
              if(_formKey.currentState.validate()){

              }
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
          GestureDetector(
            onTap: handleSignIn,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width/1.2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.red,
                          Colors.red,
                        ],
                      ),
                      borderRadius: BorderRadius.all(
                          Radius.circular(50)
                      )
                  ),
                  child: Center(
                    child: Text('Sing in with google'.toUpperCase(),
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
          /*
          Padding(
            padding: const EdgeInsets.only(bottom: 50.0),
            child: Container(
              height: 45.0,
              width: MediaQuery.of(context).size.width/1.2,
              margin: const EdgeInsets.only(top: 10.0),
              padding: const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 0.0),
              child: new Row(
                children: <Widget>[
                  new Expanded(
                    child: FlatButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      splashColor: Color(0xFF3B5998),
                      color: Color(0xff3B5998),
                      child: new Row(
                        children: <Widget>[
                          new Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Text(
                              "LOGIN WITH LINKED-IN",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          new Expanded(
                            child: Container(),
                          ),
                          new Transform.translate(
                            offset: Offset(15.0, 0.0),
                            child: new Container(
                              padding: const EdgeInsets.all(0.0),
                              child: FlatButton(
                                shape: new RoundedRectangleBorder(
                                    borderRadius:
                                    new BorderRadius.circular(28.0)),
                                splashColor: Colors.white,
                                color: Colors.white,
                                child: Text("in",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                                ),
                                onPressed: () => {},
                              ),
                            ),
                          )
                        ],
                      ),
                      onPressed: () => {},
                    ),
                  ),
                ],
              ),
            ),
          ),
           */
        ],
      ),
    );
  }
}


