import 'package:flutter/material.dart';
import 'package:flutter_app/ui/add_experience.dart';
import 'package:flutter_app/ui/add_interests.dart';
import 'package:flutter_app/ui/add_social_media.dart';

class EditScren extends StatelessWidget {
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
                hintText: "Name",
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
          Container(
            height: 45.0,
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Colors.white,
                    color: Colors.white,
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text(
                            "Add Experience",
                            style: TextStyle(color: Colors.black,
                              fontSize: 15.0,
                            ),
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
                              color: Colors.grey.shade100,
                              child: Icon(Icons.add),
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => AddExperience()),
                                );
                              },
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 22.0, 0.0, 15.0),
            child: const Divider(
              height: 1.0,
            ),
          ),
          Container(
            height: 45.0,
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Colors.white,
                    color: Colors.white,
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text(
                            "Add Interests",
                            style: TextStyle(color: Colors.black,
                              fontSize: 15.0,
                            ),
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
                              color: Colors.grey.shade100,
                              child: Icon(Icons.add),
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => AddInterests()),
                                );
                              },
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
          Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 22.0, 0.0, 15.0),
            child: const Divider(
              height: 1.0,
            ),
          ),
          Container(
            height: 45.0,
            margin: const EdgeInsets.only(top: 10.0),
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
            child: new Row(
              children: <Widget>[
                new Expanded(
                  child: FlatButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    splashColor: Colors.white,
                    color: Colors.white,
                    child: new Row(
                      children: <Widget>[
                        new Padding(
                          padding: const EdgeInsets.only(left: 0.0),
                          child: Text(
                            "Add Social Media",
                            style: TextStyle(color: Colors.black,
                              fontSize: 15.0,
                            ),
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
                              color: Colors.grey.shade100,
                              child: Icon(Icons.add),
                              onPressed: (){
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => SocialMedia()),
                                );
                              },
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
          GestureDetector(
            onTap: (){

            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
                child: Container(
                  height: 45,
                  width: MediaQuery.of(context).size.width/1.2,
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
