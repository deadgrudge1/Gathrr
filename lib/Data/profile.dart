import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:flutter_app/util/rest.dart';

class Profile{
  final String url = "profile.php";

  Rest rest;
  Map map;
  var responseArray;

  var details;
  var experiences;
  var interests;
  var links;

  Profile()
  {
    rest = new Rest(this.url);
    map = new Map<String, String>();
  }

  Future<String> getProfile() async
  {
    Map map = new Map<String, String>();
    map['get-profile'] = '1';

    String responseString = await rest.getResponse(map);
    responseArray = json.decode(responseString);
    responseArray = responseArray['payload'];

    details = responseArray['details'];
    experiences = responseArray['experiences'];
    interests = responseArray['interests'];
    links = responseArray['links'];

    return responseString;
  }



}