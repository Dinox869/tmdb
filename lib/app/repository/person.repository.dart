import 'package:get/get.dart';
import 'package:tmdb/app/providers/tmdb.provider.dart';

class PersonRepository {
late theMovieDatabaseProvider _theMovieDatabaseProvider;

  PersonRepository() {
    this._theMovieDatabaseProvider = Get.find<theMovieDatabaseProvider>();
  }


}