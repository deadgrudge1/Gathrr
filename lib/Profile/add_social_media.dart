import 'package:flutter/material.dart';

class AddSocialMedia extends StatelessWidget {
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
          'social media',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: SocialMediaBody(),
    );
  }
}

class SocialMediaBody extends StatefulWidget {
  @override
  _SocialMediaBodyState createState() => _SocialMediaBodyState();
}

class _SocialMediaBodyState extends State<SocialMediaBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Text("Facebook"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Text("Linked-In"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Text("Instagram"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(

          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Center(
            child: Text("Twitter"),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: TextField(

          ),
        ),
        GestureDetector(
          onTap: (){

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
    );
  }
}

