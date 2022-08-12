import 'dart:convert' as convert;
import 'package:flutter/services.dart';

class Helper {

  // To convert the json file data
  static Future<dynamic> getJsonFile(String path) async {
    return rootBundle.loadString(path).then(convert.jsonDecode);
  }
  }