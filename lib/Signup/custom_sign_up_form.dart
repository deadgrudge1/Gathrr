import 'package:flutter/material.dart';
import 'package:flutter_app/Profile/contact_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';

import 'package:flutter_app/Login/login.dart';

var _emailController = new TextEditingController();
var _passoneController = new TextEditingController();
var _usernameController = new TextEditingController();
var _passtwoController = new TextEditingController();

BuildContext context;

void sendData(context) async {

  var dialogResponse = "";
  int match = _passoneController.text.compareTo(_passtwoController.text);

  if(match != 0)
  {
    dialogResponse = "Passwords do not match!";
    showDialog(context: context,builder: (context) => _onTapSignUp(context, dialogResponse));
    throw new Exception("Passwords do not match");
  }

  String url = globals.url+"create-account.php";
  final response = await http.post(url, body: {
    "createaccount" : "1",
    "email" : _emailController.text,
    "password" : _passoneController.text,
  });

  var statusCode = response.statusCode;

  if (statusCode < 200 || statusCode > 400 || json == null) {
    dialogResponse = "Could not connect\nPlease try again!";
    showDialog(context: context,builder: (context) => _onTapSignUp(context, dialogResponse));
    throw new Exception("Error fetching data");
  }

  var responseArray = json.decode(response.body);
  var status = responseArray['status'];
  if(status == true) {
    dialogResponse = responseArray['msg'];
    showDialog(context: context,builder: (context) => _onTapSignUp(context, dialogResponse));

    _emailController.text = "";
    _passoneController.text = "";
    _passtwoController.text = "";
  }

  //showDialog(context: context,builder: (context) => _onTapSignUp(context));
  print(response.body);
}

_onTapSignUp(BuildContext context, var response) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      height: 300.0,
      width: 300.0,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            color: Colors.green,
            child: Padding(
              padding:  EdgeInsets.all(15.0),
              child: Icon(Icons.done,
              color: Colors.white,
              )
              /*
              Text('', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),

               */
            ),
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

class CustomSignUpForm extends StatefulWidget {
  @override
  _CustomSignUpFormState createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {

  FocusNode _focusNode = new FocusNode();

  @override
  void initState(){
    super.initState();
    _focusNode.addListener(_focusNodeListener);
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
      child: ListView(
        scrollDirection: Axis.vertical,
        physics: ScrollPhysics(),
        //crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(child: Image.asset("images/gathrrimg.png", scale: 12,)),
              Padding(
                padding: const EdgeInsets.only(top: 200.0),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Center(
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
                            controller: _emailController,
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
                                        fontSize: 18.0,
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
                          controller: _usernameController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.account_circle,
                              color: Colors.grey,
                            ),
                            hintText: 'Full Name',
                          ),
                          validator: (value){
                            if(value.isEmpty){
                              Scaffold
                                  .of(context)
                                  .showSnackBar(SnackBar
                                (content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Name field is empty",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
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
                          controller: _passoneController,
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
                                      fontSize: 18.0,
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
                          controller: _passtwoController,
                          obscureText: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.vpn_key,
                              color: Colors.grey,
                            ),
                            hintText: 'Confirm Password',
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
                                      fontSize: 18.0,
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
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 50.0, top: 10),
                            child: Center(
                              child: GestureDetector(
                                onTap: (){
                                  if(_formKey.currentState.validate()){
                                    Scaffold
                                        .of(context)
                                        .showSnackBar(SnackBar
                                      (content: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text("Processing Data",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.bold
                                        ),
                                      ),
                                    ),
                                      backgroundColor: Colors.blue,
                                    ));
                                  }
                                  Navigator.pop(context);
                                  //Navigator.pushReplacement(context,
                                  //MaterialPageRoute(builder: (context) => Login()),
                                  //);
                                },
                                child: Text('Already a user? Login',
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
                        if(_formKey.currentState.validate()){
                          sendData(context);
                          //  showDialog(context: context,builder: (context) => _onTapSignUp(context));
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
                              child: Text('Sign up'.toUpperCase(),
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
                    Container(
                      height: 45.0,
                      margin: const EdgeInsets.only(top: 10.0),
                      padding: const EdgeInsets.only(left: 35.0, right: 35.0),
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
                                      "SIGN-UP WITH LINKED-IN",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                  new Expanded(
                                    child: Container(),
                                  ),
                                  new Transform.translate(
                                    offset: Offset(15.0, 0.0),
                                    child: new Container(
                                      padding: const EdgeInsets.all(5.0),
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
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
