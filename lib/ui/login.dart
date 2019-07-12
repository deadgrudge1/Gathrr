import 'package:flutter/material.dart';
import 'custom_login_form.dart';


class Login extends StatelessWidget {

  final String title;

  Login({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: CustomLoginForm(),
    );
  }
}


