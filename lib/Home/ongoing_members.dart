import 'package:flutter/material.dart';
import 'package:flutter_app/util/data.dart';

class OngoingMembers extends StatelessWidget {
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
          'Event Members',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: Members(),
    );
  }
}

class Members extends StatefulWidget {
  @override
  _MembersState createState() => _MembersState();
}

class _MembersState extends State<Members> {
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
          padding: const EdgeInsets.only(left: 5.0),
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
                      wordSpacing: 0.5,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,

                    ),
                  ),
                ],
              ),
            ),
            subtitle: Text(designations[random.nextInt(10)].toString()),
            /*
                  Text(
                      names[random.nextInt(10)].toString() + " " + notification[random.nextInt(10)].toString(),
                  ),

                   */

            //Flexible(child: Text(" " + notification[random.nextInt(10)].toString())),

            //Text(notif['notif']),
            onTap: (){

            },
          ),
        );
      },

    );
  }
}


