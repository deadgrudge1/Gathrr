import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'login.dart';

var _emailController = new TextEditingController();
var _passoneController = new TextEditingController();
var _usernameController = new TextEditingController();

void sendData(context) async {
  String url = "http://192.168.0.109/gathrr-new/create-account.php";
  final response = await http.post(url, body: {
    "createaccount" : "1",
    "email" : _emailController.text,
    "username" : _usernameController.text,
    "password" : _passoneController.text,
  });

  print(response.body);


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
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: Text("gathrr", style: new TextStyle(
                color: Colors.blue,
                fontSize: 45,
                fontWeight: FontWeight.bold,
              ),),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50.0),
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
                      return "Please enter your name";
                    }else{
                      //_data.email = value;
                      //print("Data: ${_data.email}");
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
                /*validator: (value){
                  if(value.isEmpty){
                    return "Please enter a password";
                  }else{
                    _data.fullname = value;
                    print("Data: ${_data.fullname}");
                  }
                },*/
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
                    return "Please enter a password";
                  }else{
                    //_data.password = value;
                    //print("Data: ${_data.password}");
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
                //controller: _passtwoController,
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key,
                    color: Colors.grey,
                  ),
                  hintText: 'Confirm Password',
                ),
                /*validator: (value){
                  if(value.isEmpty){
                    return "Please enter a password";
                  }else{
                    _data.confirm_password = value;
                    print("Data: ${_data.confirm_password}");
                  }
                },*/
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
