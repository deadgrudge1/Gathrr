import 'package:flutter/material.dart';
import 'package:flutter_app/ui/contact_profile.dart';
import 'package:flutter_app/ui/profile_page.dart';

var globalContacts;

class MyContacts extends StatefulWidget {

  @override
  _MyContactsState createState() => _MyContactsState();
}

class _MyContactsState extends State<MyContacts> {

  @override
  Widget build(BuildContext context) {
    globalContacts = context;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
        flexibleSpace: Container(
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
        centerTitle: true,
        title: Text('gathrr', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 30,
        ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            GestureDetector(
              onTap: (){
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ContactProfile()),
                );
              },
              child: new Card(
                color: Colors.grey.shade200,
                child: ListTile(
                  leading: const Icon(Icons.person),
                  title: Text('Shreyas Hosmani', style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),),
                  subtitle: Text('Front-End Developer'),
                ),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Amit Chaudhari', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Back-End Developer'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Jeet Vithalani', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('UI/UX, Analytics'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Tony Stark', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Tech Savy, Iron Man'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Barry Allen', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Fastest Person'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Black Panther', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Vibranium Protector'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Captain America', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('First Avenger'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('The Thor', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Thunder God'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Captain Marvel', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Universe Protecter'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Shreyas Hosmani', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Front-End Developer'),
              ),
            ),
            new Card(
              color: Colors.grey.shade200,
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Amit Chaudhari', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('Back-End Developer'),
              ),
            ),
            new Card(
              child: ListTile(
                leading: const Icon(Icons.person),
                title: Text('Jeet Vithalani', style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),),
                subtitle: Text('UI/UX, Analytics'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
