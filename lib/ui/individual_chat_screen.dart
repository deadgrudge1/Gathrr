import 'package:flutter/material.dart';

class IndiChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Column(
          children: <Widget>[
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Shreyas Hosmani",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "6.00 pm",
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  "Hey, Lets gathrr!",
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Jeet Vithlani",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "6.02 pm",
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  "Yup!",
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ),
            new Container(
              height: 1.5,
              color: Colors.grey.shade200,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Center(
                child: Text("SATURDAY",
                style: new TextStyle(
                  color: Colors.grey.shade700,
                  fontWeight: FontWeight.w500
                ),),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Shreyas Hosmani",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "8.07 am",
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  "Jeet, catch you up at office?",
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Jeet Vithlani",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "8.12 am",
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  "Yes, sounds good!",
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Jeet Vithlani",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "8.13 am",
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  "Till what time will you reach by?",
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ),
            new ListTile(
              leading: new CircleAvatar(
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Shreyas Hosmani",
                    style: new TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Text(
                    "8.15 am",
                    style: new TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: new Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: new Text(
                  "Already left, in an hour!",
                  style: new TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
            ),
          ],
        ),
        new Expanded(
          child: new Container(),
        ),
        new Container(
          height: 1.5,
          color: Colors.grey.shade300,
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0, left: 10.0, right: 10.0),
          child: textComposerWidget(),
        ),
      ],
    );
  }

  Widget textComposerWidget() {
    var myController = new TextEditingController();
    return new Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: new TextField(
                controller: myController,
                decoration:
                new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              icon: new Icon(Icons.send),
              onPressed: (){},
            ),
          )
        ],
      ),
    );
  }
}
