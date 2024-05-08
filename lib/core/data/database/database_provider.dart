import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBProvider {
  static final DBProvider db = DBProvider();
  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }
  Future<Database> initDB() async {
    final documentDirectory = await getApplicationSupportDirectory();
    final path = join(documentDirectory.path, "LocalDb.db");
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      //TODO для оптимизации пока-что так, потом надо будет сделать плоскими полями ( пока не требуется )
      await db.execute("CREATE TABLE AnimeApiItem ("
          "id TEXT PRIMARY KEY,"
          "type TEXT,"
          "link TEXT,"
          "title TEXT,"
          "titleOrig TEXT,"
          "year INTEGER,"
          "seasons TEXT,"
          "materialData TEXT"
          ")");
    });

  }
}
