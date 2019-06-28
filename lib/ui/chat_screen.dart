import 'package:flutter/material.dart';
import 'package:login_sample_one/ui/main_indi_chat.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade900,
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
          "Your Chats",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Chat(),
    );
  }
}

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => MainIndiChat()),
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
        ],
      ),
    );
  }
}

