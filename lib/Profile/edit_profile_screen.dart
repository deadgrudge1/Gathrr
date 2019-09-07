import 'package:flutter/material.dart';
import 'package:flutter_app/Profile/add_experience.dart';
import 'package:flutter_app/Profile/add_interests.dart';
import 'package:flutter_app/Profile/add_social_media.dart';
import 'package:flutter_app/Profile/contact_page.dart';
import 'package:flutter_app/Profile/main_profile.dart' as prefix0;

class EditScren extends StatelessWidget {
  //String name, bio, designation;
  //EditScren(this.name, this.bio, this.designation) : super();

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
          'Edit Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: CreateEditBody(),
    );
  }
}

class CreateEditBody extends StatefulWidget {
  @override
  _CreateEditBodyState createState() => _CreateEditBodyState();
}

class _CreateEditBodyState extends State<CreateEditBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          Stack(
            children: <Widget>[
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                        border: new Border.all(
                          width: 1.5,
                          color: Colors.white,
                        ),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(
                                "https://qph.fs.quoracdn.net/main-raw-226477733-zskxlexzsxfiubrenlkcrywxnrzoswrk.jpeg"))),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 130.0, left: 50.0),
                child: Center(
                  child: Container(
                    height: 40.0,
                    width: 40.0,
                    child: FloatingActionButton(
                      onPressed: (){
                        //PENDING...
                      },
                      child: Icon(Icons.edit),
                    ),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            title: TextField(
              decoration: InputDecoration(
                hintText: prefix0.name,
              ),
            ),
          ),
          ListTile(
            title: TextField(
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ListTile(
              title: Container(
                margin: EdgeInsets.only(top: 15.0),
                height: 130.0,
                padding: EdgeInsets.only(bottom: 20.0),
                child: TextField(
                  maxLines: 99,
                  decoration: InputDecoration(
                    hintText: "Your Bio...",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
            child: const Divider(
              height: 1.0,
            ),
          ),
          ListTile(
            title: TextField(
              decoration: InputDecoration(
                hintText: "Designation",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 15.0),
            child: const Divider(
              height: 1.0,
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
      ),
    );
  }
}
