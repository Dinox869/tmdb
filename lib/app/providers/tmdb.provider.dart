import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/providers/api_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart' as foundation;

class theMovieDatabaseProvider extends GetxService with ApiClient {
  late dio.Dio _httpClient;
  late dio.Options _optionsNetwork;
  late dio.Options _optionsCache;

  theMovieDatabaseProvider() {
    baseUrl = globalService.baseUrl;
    _httpClient = new dio.Dio();
    _httpClient.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
  }

    Future<theMovieDatabaseProvider> init() async {
    if (foundation.kIsWeb || foundation.kDebugMode) {
      _optionsNetwork = dio.Options();
      _optionsCache = dio.Options();
    } else {
      _optionsNetwork =
          buildCacheOptions(Duration(days: 3), forceRefresh: true);
      _optionsCache =
          buildCacheOptions(Duration(minutes: 10), forceRefresh: false);
      _httpClient.interceptors.add(
          DioCacheManager(CacheConfig(baseUrl: getApiBaseUrl(""))).interceptor);
    }
    return this;
  }

  }