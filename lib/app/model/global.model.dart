class Global{
  
  String? tmdbUrl;
  String? apiToken;
  String? apikey;
  

  Global.fromJson(Map<String, dynamic> json) {
    apikey = json['api_key'].toString();
    apiToken = json['apiToken'].toString();
    tmdbUrl = json['tmdbUrl'].toString();
  }

  Global({ this.apiToken, this.tmdbUrl, this.apikey});

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['api_key'] = apikey;
    data['apiToken'] = apiToken;
    data['tmdbUrl'] = tmdbUrl;
    return data;
  }
}
