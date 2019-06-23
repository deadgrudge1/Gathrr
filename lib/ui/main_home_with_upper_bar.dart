import 'package:flutter/material.dart';

class MainHomeWithUpperBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
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
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.photo),
                text: "Previos Events",),
                Tab(icon: Icon(Icons.assignment),
                text: "Ongoing Events",),
                Tab(icon: Icon(Icons.add_photo_alternate),
                text: "Upcoming Events",),
              ],
            ),
            centerTitle: true,
            title: Text('gathrr', style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    new Card(
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Icon(Icons.image,
                                    size: 150,
                                    color: Colors.blueGrey,),
                                  ListTile(
                                    leading: const Icon(Icons.album),
                                    title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0,
                                    ),),
                                    subtitle: Text('July 2019.'),
                                  ),
                                ],
                              ),
                            ],
                        ),
                    ),
                    new Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Icon(Icons.image,
                                size: 150,
                                color: Colors.blueGrey,),
                              ListTile(
                                leading: const Icon(Icons.album),
                                title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),),
                                subtitle: Text('July 2019.'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    new Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Icon(Icons.image,
                                size: 150,
                                color: Colors.blueGrey,),
                              ListTile(
                                leading: const Icon(Icons.album),
                                title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),),
                                subtitle: Text('July 2019.'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  new Card(
                      child: new Column(
                        children: <Widget>[
                          new Icon(Icons.image,
                            size: 150,
                            color: Colors.blueGrey,),
                          ListTile(
                            leading: const Icon(Icons.album),
                            title: Text('Artificial Intelligence Impact', style: new TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),),
                            subtitle: Text('July 2019.'),
                          ),
                        ],
                      ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    new Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Icon(Icons.image,
                                size: 150,
                                color: Colors.blueGrey,),
                              ListTile(
                                leading: const Icon(Icons.album),
                                title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),),
                                subtitle: Text('July 2019.'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    new Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Icon(Icons.image,
                                size: 150,
                                color: Colors.blueGrey,),
                              ListTile(
                                leading: const Icon(Icons.album),
                                title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),),
                                subtitle: Text('July 2019.'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    new Card(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new Icon(Icons.image,
                                size: 150,
                                color: Colors.blueGrey,),
                              ListTile(
                                leading: const Icon(Icons.album),
                                title: Text('Upcoming Gathrr Event Is Here', style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),),
                                subtitle: Text('July 2019.'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
