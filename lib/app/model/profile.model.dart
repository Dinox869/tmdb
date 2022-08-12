class Profiles {
  double? aspectRatio;
  int? height;
  String? filePath;
  double? voteAverage;
  int? voteCount;
  int? width;

  Profiles(
      {this.aspectRatio,
      this.height,
      this.filePath,
      this.voteAverage,
      this.voteCount,
      this.width});

  Profiles.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = aspectRatio;
    data['height'] = height;
    data['file_path'] = filePath;
    data['vote_average'] = voteAverage;
    data['vote_count'] = voteCount;
    data['width'] = width;
    return data;
  }

    Map<String, dynamic> toMap() {
    return {
      'filePath': filePath,
      'height': height.toString(),
      'width': width.toString(),
    };
  }
}