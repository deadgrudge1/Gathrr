import 'package:flutter/material.dart';
import 'package:flutter_app/util/data.dart';

class EventNotices extends StatelessWidget {

  //List names = ["Jeet Vithalani", "Shreyas Hosmani", "Amit Chaudhari", "Rohan Beldar", "Vatsal Kanakiya"];
  //List notifStatement = ["scanned you", "sent you a friend request", "fucked you", "fucked me", "kicked me"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text(
          "Notifications",
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list,
            ),
            onPressed: (){},
          ),
        ],
      ),

      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Divider(),
            ),
          );
        },
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          Map notif = notifications[index];
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  notif['dp'],
                ),
                radius: 25,
              ),
              contentPadding: EdgeInsets.all(0),
              title: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(text: names[random.nextInt(10)].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                          color: Colors.black,

                        ),
                    ),
                    TextSpan(text: " " + notification[random.nextInt(10)].toString(),
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
                  /*
                  Text(
                      names[random.nextInt(10)].toString() + " " + notification[random.nextInt(10)].toString(),
                  ),

                   */

                  //Flexible(child: Text(" " + notification[random.nextInt(10)].toString())),

              //Text(notif['notif']),
              trailing: Text(
                notif['time'],
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
              onTap: (){

              },
            ),
          );
        },

      ),
    );
  }
}