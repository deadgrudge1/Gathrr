import 'package:http/http.dart' as http;
import 'package:flutter_app/util/globals.dart' as globals;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_app/util/rest.dart';

class ProfileData {

  String name;
  String designation;
  String bio;
  List experienceTitles;
  List experienceCompanies;
  List experienceStartDate;
  List experienceEndDate;
  List interests;
  List socialMediaLinks;

}