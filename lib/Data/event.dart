import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:flutter_app/util/rest.dart';

class Event{
  final String url = "events.php";

  Rest rest;
  Map map;
  var responseArray;

  var pastEvents;
  var upcomingEvents;

  Event()
  {
    rest = new Rest(this.url);
    map = new Map<String, String>();
  }

  Future<String> getEvents() async
  {
    Map map = new Map<String, String>();
    map['get-events'] = '1';

    String responseString = await rest.getResponse(map);
    responseArray = json.decode(responseString);

    pastEvents = responseArray['past'];
    upcomingEvents = responseArray['upcoming'];

    return responseString;
  }

}