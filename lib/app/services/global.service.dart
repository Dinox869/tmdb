import 'package:get/get.dart';
import 'package:tmdb/app/model/global.model.dart';

import '../../common/helper.dart';


class GlobalService extends GetxService {
  final global = Global().obs;

  Future<GlobalService> init() async {
    var response = await Helper.getJsonFile('config/global.json');
    global.value = Global.fromJson(response);
    return this;
  }

  String get baseUrl => global.value.tmdbUrl!;
  String get apiKey => global.value.apikey!;
}
