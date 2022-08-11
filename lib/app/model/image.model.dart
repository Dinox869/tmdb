import 'package:tmdb/app/model/profile.model.dart';

class Image {
  int? id;
  List<Profiles>? profiles;

  Image({this.id, this.profiles});

  Image.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['profiles'] != null) {
      profiles = [];
      json['profiles'].forEach((v) {
        profiles?.add( Profiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (profiles != null) {
      data['profiles'] = profiles?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
