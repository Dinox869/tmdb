import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tmdb/app/model/profile.model.dart';
import 'package:tmdb/app/model/results.model.dart';

class DbHelper extends GetxService{
  late Database _database;

  Future openDb() async {

    _database = await openDatabase(
      join(await getDatabasesPath(), "images.db"),
      version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          "CREATE TABLE images(id INTEGER PRIMARY KEY autoincrement, filePath TEXT, height TEXT, width TEXT)",
        );
        await db.execute(
          "CREATE TABLE popular(id INTEGER PRIMARY KEY autoincrement, name TEXT, profilePath TEXT)",
        );
      });

      return _database;
  }

  Future insertModel(Profiles profiles) async {
    await openDb();
    return await _database.insert('images', profiles.toMap());
  }

  Future<List<Profiles>> getProfileList() async {
    await openDb();

    final List<Map<String, dynamic>> maps = await _database.query('images');

    return List.generate( maps.length, (i) {
      return Profiles(
          filePath: maps[i]['filePath'],
          height: int.parse(maps[i]['height']),
          width: int.parse(maps[i]['width'])
          );
    });
  } 

  Future insertResults(Results results) async {
    await openDb();
    return await _database.insert('popular', results.toMap());
  }

    Future<List<Results>> getResultsList() async {
    await openDb();

    final List<Map<String, dynamic>> maps = await _database.query('popular');

    return List.generate( maps.length, (i) {
      return Results(
          name: maps[i]['name'],
          profilePath: maps[i]['profilePath'],
          );
    });
  } 

  

}