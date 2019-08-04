import 'package:flutter/material.dart';
import 'package:flutter_app/ui/add_experience.dart';
import 'package:flutter_app/ui/add_interests.dart';

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
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10.0),
              child: Icon(
                Icons.account_circle,
                size: 150.0,
                color: Colors.grey.shade700,
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.grey.shade700,
            ),
            title: TextField(
              decoration: InputDecoration(
                hintText: "Name",
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.grey.shade700,
            ),
            title: TextField(
              decoration: InputDecoration(
                hintText: "Email",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.assignment,
                  color: Colors.grey.shade700,
                ),
              ),
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
            leading: Icon(
              Icons.account_box,
              color: Colors.grey.shade700,
            ),
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
          GestureDetector(
            onTap: (){

            },
            child: Center(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 15, 20, 20),
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
