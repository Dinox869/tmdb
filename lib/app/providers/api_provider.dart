import 'package:get/get.dart';
import 'package:tmdb/app/services/global.service.dart';


mixin ApiClient {
  final globalService = Get.find<GlobalService>();
  String? baseUrl;
  String? baseUrlDev;

  String getBaseUrl(String path) {
    // if (!path.endsWith('/')) {
    //   path += '/';
    // }
    if (path.startsWith('/')) {
      path = path.substring(1);
    }
    if (!baseUrl!.endsWith('/')) {
      return baseUrl! + '/' + path;
    }
    return baseUrl! + path;
  }

  String getApiBaseUrl(String path) {
    String _apiPath = globalService.baseUrl;
    if (path.startsWith('/')) {
      return getBaseUrl(path) + path.substring(1);
    }
    print('path is ${getBaseUrl(path)}');
    return getBaseUrl(path);
  }

  Uri getApiBaseUri(String path) {
    return Uri.parse(getApiBaseUrl(path));
  }

  Uri getBaseUri(String path) {
    return Uri.parse(getBaseUrl(path));
  }
}
