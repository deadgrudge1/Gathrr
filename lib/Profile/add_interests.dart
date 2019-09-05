import 'package:flutter/material.dart';

class AddInterests extends StatelessWidget {
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
          'interests',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: AddInterestsBody(),
    );
  }
}

class AddInterestsBody extends StatefulWidget {
  @override
  _AddInterestsBodyState createState() => _AddInterestsBodyState();
}

class _AddInterestsBodyState extends State<AddInterestsBody> {

  TextEditingController _textFieldControllerone = TextEditingController();
  TextEditingController _textFieldControllertwo = TextEditingController();
  TextEditingController _textFieldControllerthree = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: InputChip(
              avatar: Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              label: TextField(
                controller: _textFieldControllerone,
                decoration: InputDecoration(hintText: "A Chip input field"),
              ),
              labelPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
            ),
          ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: InputChip(
            avatar: Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            label: TextField(
              controller: _textFieldControllertwo,
              decoration: InputDecoration(hintText: "A Chip input field"),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: InputChip(
            avatar: Icon(
              Icons.cancel,
              color: Colors.red,
            ),
            label: TextField(
              controller: _textFieldControllerthree,
              decoration: InputDecoration(hintText: "A Chip input field"),
            ),
            labelPadding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
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
    );
  }
}

