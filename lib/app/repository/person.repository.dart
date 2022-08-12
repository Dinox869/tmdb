import 'package:get/get.dart';
import 'package:tmdb/app/model/image.model.dart';
import 'package:tmdb/app/model/person.model.dart';
import 'package:tmdb/app/model/response.model.dart' as pop;
import 'package:tmdb/app/providers/tmdb.provider.dart';

class PersonRepository {
late theMovieDatabaseProvider _theMovieDatabaseProvider;

  PersonRepository() {
    _theMovieDatabaseProvider = Get.find<theMovieDatabaseProvider>();
  }
  
  //Fetch popular people
  Future<pop.Response> getAll(int page) {
    return _theMovieDatabaseProvider.getAll(page);
  }

  //Fetch person details
  Future<Person> getPerson(int id) {
    return _theMovieDatabaseProvider.getPerson(id);
  }

  //Fetch person images
  Future<Image> getImages(int id) {
    return _theMovieDatabaseProvider.getImages(id);
  }


}