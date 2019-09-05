import 'package:flutter/material.dart';
import 'package:flutter_app/Profile/add_experience.dart';

class EditExperience extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.white,
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
          'experience',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: EditExpBody(),
    );
  }
}

class EditExpBody extends StatefulWidget {
  @override
  _EditExpBodyState createState() => _EditExpBodyState();
}

class _EditExpBodyState extends State<EditExpBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: const Icon(Icons.supervised_user_circle),
              title: Text(
                'Tecnical Co-Founder @gathrr.in',
                style: new TextStyle(
                  fontSize: 15.0,
                ),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    'Present - 2 months',
                    style: new TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AddExperience()),
                      );
                    },
                    icon: Icon(Icons.edit,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: const Icon(Icons.supervised_user_circle),
              title: Text(
                'Flutter Developer @Spaising Technologies',
                style: new TextStyle(
                  fontSize: 15.0,
                ),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    'Jan 2019 - May 2019',
                    style: new TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.edit,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Container(
            color: Colors.white,
            child: ListTile(
              leading: const Icon(Icons.supervised_user_circle),
              title: Text(
                'Student at SKNCOE',
                style: new TextStyle(
                  fontSize: 15.0,
                ),
              ),
              subtitle: Row(
                children: <Widget>[
                  Text(
                    '2015 - 2019',
                    style: new TextStyle(
                      fontSize: 13.0,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    onPressed: (){

                    },
                    icon: Icon(Icons.edit,
                      color: Colors.black,
                      size: 15.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

