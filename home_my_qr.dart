import 'package:flutter/material.dart';

class MYQR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.all(10.0),
        child: Card(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.asset("images/qr.png",
                height: 175.0,
                width: 175.0,),
                Text("Scan My QR",
                style: new TextStyle(
                  fontSize: 18,
                ),),
                Text("To Add Me In Your Contacts|",
                  style: new TextStyle(
                    fontSize: 18,
                  ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
