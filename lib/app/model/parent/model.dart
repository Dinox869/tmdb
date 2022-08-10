import 'dart:convert';

abstract class Model {
  String? id;

  bool get hasData => id != null;

  void fromJson(Map<String, dynamic> json) {
    id = stringFromJson(json, 'id');
  }

  @override
  bool operator ==(dynamic other) {
    return other.id == this.id;
  }

  @override
  int get hashCode => this.id.hashCode;

  Map<String, dynamic> toJson();

  @override
  String toString() {
    return toJson().toString();
  }

  String stringFromJson(Map<String, dynamic> json, String attribute,
      {String defaultValue = ''}) {
    try {
      return json != null
          ? json[attribute] != null
              ? json[attribute].toString()
              : defaultValue
          : defaultValue;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }
  
  dynamic mapFromJson(Map<String, dynamic> json, String attribute,
      {Map<dynamic, dynamic>? defaultValue}) {
    try {
      return json != null
          ? json[attribute] != null
              ? jsonDecode(json[attribute])
              : defaultValue
          : defaultValue;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }

  int intFromJson(Map<String, dynamic> json, String attribute,
      {int defaultValue = 0}) {
    try {
      if (json != null && json[attribute] != null) {
        if (json[attribute] is int) {
          return json[attribute];
        }
        return int.parse(json[attribute]);
      }
      return defaultValue;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }
  
  bool boolFromJson(Map<String, dynamic> json, String attribute,
      {bool defaultValue = false}) {
    try {
      if (json != null && json[attribute] != null) {
        if (json[attribute] is bool) {
          return json[attribute];
        } else if ((json[attribute] is String) &&
            !['0', '', 'false'].contains(json[attribute])) {
          return true;
        } else if ((json[attribute] is int) &&
            ![0, -1].contains(json[attribute])) {
          return true;
        }
        return false;
      }
      return defaultValue;
    } catch (e) {
      throw Exception(
          'Error while parsing ' + attribute + '[' + e.toString() + ']');
    }
  }

  List<T> listFromJson<T>(Map<String, dynamic> json, String attribute,
      T Function(Map<String, dynamic>) callback) {
    try {
      List<T> _list = <T>[];
      if (json != null &&
          json[attribute] != null &&
          json[attribute] is List &&
          json[attribute].length > 0) {
        json[attribute].forEach((v) {
          if (v is Map<String, dynamic>) {
            _list.add(callback(v));
          }
        });
      }
      return _list;
    } catch (e) {
      throw Exception('Error while parsing ' +
          attribute.toString() +
          '[' +
          e.toString() +
          ']');
    }
  }
}
