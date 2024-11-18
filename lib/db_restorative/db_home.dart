
import 'package:get/get.dart';
import 'package:home_restoratives/db_restorative/home_entity.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';


class DBHome extends GetxService {
  late Database dbBase;

  Future<DBHome> init() async {
    await createHomeDB();
    return this;
  }

  createHomeDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'home.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createHomeTable(db);
          final SharedPreferences prefs =
          await SharedPreferences.getInstance();
          await prefs.setBool('warning', true);
        });
  }

  createHomeTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS home (id INTEGER PRIMARY KEY, createdTime TEXT, type INTEGER, image BLOB, name TEXT, finishTime TEXT, hadWarn INTEGER)');
  }

  insertHome(HomeEntity entity) async {
    final id = await dbBase.insert('home', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'image': entity.image,
      'name': entity.name,
      'finishTime': entity.finishTime.toIso8601String(),
      'hadWarn': entity.hadWarn,
    });
    return id;
  }

  updateHome(HomeEntity entity) async {
    await dbBase.update('home', {
      'createdTime': entity.createdTime.toIso8601String(),
      'type': entity.type,
      'image': entity.image,
      'name': entity.name,
      'finishTime': entity.finishTime.toIso8601String(),
      'hadWarn': entity.hadWarn,
    }, where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanHomeData() async {
    await dbBase.delete('home');
  }

  Future<List<HomeEntity>> getHomeAllData({int? type}) async {
    final result = await dbBase.query('home',
        where: type != null ? 'type = ?' : null,
        whereArgs: type != null ? [type] : null,
        orderBy: 'createdTime DESC');
    return result.map((e) => HomeEntity.fromJson(e)).toList();
  }
}
