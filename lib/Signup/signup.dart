import 'package:flutter/material.dart';
import 'package:flutter_app/Signup/custom_sign_up_form.dart';

class SignUp extends StatelessWidget {

  final String title;

  SignUp({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Colors.white,
      body: CustomSignUpForm(),
    );
  }
}
