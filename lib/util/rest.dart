import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class Rest
{
  String url = globals.url;
  http.Response response;
  var token;
  var responseArray;
  String myString;

  /*Rest(String url)
  {
    this.url = this.url + url;

  }*/

  Rest(String url)
  {
    this.url = this.url + url;

  }

  Future<String> getResponse(Map<String, String> map) async
  {
    authenticate().then((dynamic)
    {
      getData(map).then((dynamic){
        return myString;
      }
      );
    }
    );

  }

  Future<String> authenticate() async
  {
    final prefs = await SharedPreferences.getInstance();
    var token = prefs.get("token");
    if (token != null) {
      this.token = token;
    }
    print('authenticate');
    return token;
  }

  Future<String> getData(Map<String, String> map) async
  {
    if (this.token != null) {
      map['token'] = this.token;
      //print("dd : "+ map.toString());
    }

    http.Response response = await http.post(url, body: map).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error fetching data");
      }

      this.myString = response.body;
      print('getData');
      //print(responseArray);
      //return responseArray;
    });
    return this.myString;
  }


}