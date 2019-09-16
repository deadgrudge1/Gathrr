import 'package:flutter/material.dart';
import 'package:flutter_app/util/data.dart';

class OngoingNotifications extends StatelessWidget {
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
          'Notifications',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: OngoingNotices(),
    );
  }
}

class OngoingNotices extends StatefulWidget {
  @override
  _OngoingNoticesState createState() => _OngoingNoticesState();
}

class _OngoingNoticesState extends State<OngoingNotices> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
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

    );
      /*
      Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: new CircleAvatar(
                radius: 5.0,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.black,
              ),
              title: new Text(
                "Oganiser: Sorry to inform, event has postponed 10 mins!",
                style: new TextStyle(
                  fontSize: 16,
                  //color: Colors.grey.shade600
                ),
              ),
            ),
            new Container(
              height: 1.5,
              color: Colors.grey.shade100,
            ),
            ListTile(
              leading: new CircleAvatar(
                radius: 5.0,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.black,
              ),
              title: new Text(
                "Event sponser coming in 15 mins",
                style: new TextStyle(
                  fontSize: 16,
                  //color: Colors.grey.shade600
                ),
              ),
            ),
            new Container(
              height: 1.5,
              color: Colors.grey.shade100,
            ),
            ListTile(
              leading: new CircleAvatar(
                radius: 5.0,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.black,
              ),
              title: new Text(
                "Please checkout upcoming events from us!",
                style: new TextStyle(
                  fontSize: 16,
                  //color: Colors.grey.shade600
                ),
              ),
            ),
            new Container(
              height: 1.5,
              color: Colors.grey.shade100,
            ),
          ],
        ),
      ),
    );

       */
  }
}

