import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/util/utils.dart';

class MYQR extends StatelessWidget {

  Screen size;

  @override
  Widget build(BuildContext context) {

    size = Screen(MediaQuery.of(context).size);

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
        title: Text("My Gathrr ID QR",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        /*
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset("images/gathrr_name.png"),
        )

         */
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 0.0),
        child: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            physics: ScrollPhysics(),
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.width/0.85,
                    width: MediaQuery.of(context).size.width/1.2,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      color: Colors.blue.shade700,
                      elevation: 0.2,
                      child: Stack(
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 20.0, left: 0.0),
                                      child: Text("Amit",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.width/10.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 0.0),
                                      child: Text("Chaudhari",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: MediaQuery.of(context).size.width/10.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0, bottom: 20.0),
                                child: Center(
                                  child: Container(
                                    height: MediaQuery.of(context).size.width/1.5,
                                      width: MediaQuery.of(context).size.width/1.5,
                                      child: Card(
                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                        elevation: 0.0,
                                        color: Colors.white,//grey.shade200,
                                        child: Center(
                                          child: Image.asset("images/qr.png",
                                            scale: 1.0,
                                          ),
                                        ),
                                      ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0),
                                child: Center(
                                    child: Text("SCAN MY QR CODE TO ADD ME",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: MediaQuery.of(context).size.width/28.0,
                                      ),
                                    ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}