import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/util/rest.dart';

class EventData {

  List eventTitle = [];
  List eventOrganiser = [];
  List startDate = [];
  List endDate = [];
  List description = [];
  List location = [];
  List organiserDetails = [];

}