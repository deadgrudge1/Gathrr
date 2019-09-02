import 'package:flutter/material.dart';
import 'package:flutter_app/Profile/contact_page.dart';

class ContactProfile extends StatelessWidget {
  String username;
  ContactProfile(this.username) : super();

  @override
  Widget build(BuildContext context) {
    print(username);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        /*flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.blue.shade900,
                Colors.blue.shade500
              ],
            ),
          ),
        ),

         */

        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("images/gathrr_name.png"),
        ),
        elevation: 0,
        backgroundColor: Colors.blue.shade900,
      ),
      body: new ContactPage(username),
    );
  }
}
