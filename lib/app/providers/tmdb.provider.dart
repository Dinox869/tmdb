import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/model/image.model.dart';
import 'package:tmdb/app/model/person.model.dart';
import 'package:tmdb/app/model/response.model.dart' as pop;
import 'package:tmdb/app/providers/api_provider.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart' as foundation;
import 'package:tmdb/app/providers/networkExceptions.dart';
import 'package:tmdb/app/services/global.service.dart';

class theMovieDatabaseProvider extends GetxService with ApiClient {

  final globalService = Get.find<GlobalService>();

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

  Future<pop.Response> getAll(int page) async{
     var _queryParameters = {
      'api_key': globalService.apiKey,
      'language' : 'en-US',
      'page' : page.toString()
    };

    Uri _uri = getApiBaseUri("popular")
        .replace(queryParameters: _queryParameters);

    try {

      var response = await _httpClient.getUri(_uri, options: _optionsNetwork);

      if (response.statusCode == 200) {
        return pop.Response.fromJson(response.data);
      } else {
        throw NetworkException()
            .errorCode(response.statusCode!, response.data['message']);
      }
    } on dio.DioError catch (e) {
      throw NetworkException().dioError(e);
    }
  }

  Future<Person> getPerson(int id) async{
    var _queryParameters = {
          'api_key': globalService.apiKey,
          'language' : 'en-US',
        };

    Uri _uri = getApiBaseUri('$id')
        .replace(queryParameters: _queryParameters);

    try {

      var response = await _httpClient.getUri(_uri, options: _optionsNetwork);

      if (response.statusCode == 200) {
        return Person.fromJson(response.data);
      } else {
        throw NetworkException()
            .errorCode(response.statusCode!, response.data['message']);
      }
    } on dio.DioError catch (e) {
      throw NetworkException().dioError(e);
    }
  }

  Future<Image> getImages(int id) async{
    var _queryParameters = {
          'api_key': globalService.apiKey,
          'language' : 'en-US',
        };

    Uri _uri = getApiBaseUri('$id/images')
        .replace(queryParameters: _queryParameters);

    try {

      var response = await _httpClient.getUri(_uri, options: _optionsNetwork);

      if (response.statusCode == 200) {
        return Image.fromJson(response.data);
      } else {
        throw NetworkException()
            .errorCode(response.statusCode!, response.data['message']);
      }
    } on dio.DioError catch (e) {
      throw NetworkException().dioError(e);
    }
  }

  }