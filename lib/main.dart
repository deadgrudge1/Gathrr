import 'package:flutter/material.dart';
import 'package:flutter_app/ui/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './ui/login.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
BuildContext context;
final FirebaseMessaging _messaging = FirebaseMessaging();
final FirebaseMessaging _fcm = FirebaseMessaging();

void main() async {
  //getData();
  isSplash();
  initFCM();
}

initFCM() async {
  flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();
  var android = new AndroidInitializationSettings('@mipmap/ic_launcher');
  var iOS = new IOSInitializationSettings();
  var initSetttings = new InitializationSettings(android, iOS);
  flutterLocalNotificationsPlugin.initialize(initSetttings,
      onSelectNotification: onSelectNotification);

  _messaging.getToken().then((token) {
    print(token);
  });
  _fcm.configure(
    onMessage: (Map<String, dynamic> message) async {
      print("onMessagea: $message");
      print("testingNotif:" + message['notification']['title']);
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: ListTile(
            title: Text(message['notification']['title']),
            subtitle: Text(message['notification']['body']),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text("OK"),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        ),
      );
      //showNotification(message);
    },
    onLaunch: (Map<String, dynamic> message) async {
      print("onLaunch: $message");
      // TODO optional
      showNotification(message);
    },
    onResume: (Map<String, dynamic> message) async {
      print("onResume: $message");
      // TODO optional
      showNotification(message);
    },
  );
}


showNotification(var message) async {


  var android = new AndroidNotificationDetails(
      'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
      priority: Priority.High,importance: Importance.Max
  );
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android, iOS);
  await flutterLocalNotificationsPlugin.show(
      1, message.toString(), message.toString(), platform,
      payload: 'Please check the ongoing event list for a new card!');
}

Future onSelectNotification(String payload) {
  debugPrint("payload : $payload");
  showDialog(
    context: context,
    builder: (_) => new AlertDialog(
      title: new Text('Notification'),
      content: new Text('$payload'),
    ),
  );
}

void isSplash() async {
  final prefs = await SharedPreferences.getInstance();
  var isSplash = false;
  try {
    isSplash = prefs.getBool("isSplash");
    if(isSplash == true)
    {
      var title = "Login";
      runApp(new MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        home: Login(),
      ));
    }else{
      throw new Exception();
    }
  }catch(e){
    var title = "Login";
    runApp(new MaterialApp(
      debugShowCheckedModeBanner: false,
      title: title,
      home: SplashScreen(),
    ));
  }

}

