import 'package:flutter/material.dart';
import 'package:flutter_app/ui/contact_page.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/globals.dart' as globals;

import 'login.dart';

var _emailController = new TextEditingController();
var _passoneController = new TextEditingController();
var _usernameController = new TextEditingController();

BuildContext context;

void sendData(context) async {
  String url = globals.url+"create-account.php";
  final response = await http.post(url, body: {
    "createaccount" : "1",
    "email" : _emailController.text,
    "password" : _passoneController.text,
  });
  //showDialog(context: context,builder: (context) => _onTapSignUp(context));
  print(response.body);
}

_onTapSignUp(BuildContext context) {
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
            child: Text('SUCCESS', style: TextStyle(color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text('You have signed up successfully, please verify your email address to login!', style: TextStyle(color: Colors.black),),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(child: Image.asset("images/gathrrimg.png", scale: 10,)),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Container(
                width: MediaQuery.of(context).size.width/1.2,
                height: 55,
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
                      return "Please enter your email";
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
              height: 55,
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
                    return "Please enter your name";
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
              height: 55,
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
                    return "Please enter a password";
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
              height: 55,
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
                //controller: _passtwoController,
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
                    return "Please enter your password one more time";
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
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()),
                        );
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
              sendData(context);
              if(_formKey.currentState.validate()){
                showDialog(context: context,builder: (context) => _onTapSignUp(context));
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
        ],
      ),
    );
  }
}
