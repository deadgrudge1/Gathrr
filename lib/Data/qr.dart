import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:flutter_app/util/rest.dart';

class QR{
  final String url = "get-qr.php";

  Rest rest;
  Map map;
  var responseArray;

  var linkQR;

  QR()
  {
    rest = new Rest(this.url);
    map = new Map<String, String>();
  }

  Future<String> getQR() async
  {
    Map map = new Map<String, String>();
    //map['get-events'] = '1';

    String responseString = await rest.getResponse(map);
    responseArray = json.decode(responseString);

    print("QR Class responseArray : " + responseArray);

    linkQR = responseArray.toString();

    return responseString;
  }

}