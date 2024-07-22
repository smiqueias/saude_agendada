import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> openSqfliteDb() async {
  final docuemntsDirecory = await getApplicationDocumentsDirectory();
  String path = join(docuemntsDirecory.path, 'app_db.bd');
  final db = await openDatabase(
    path,
    onCreate: (db, version) async {
      db.execute(
        'CREATE TABLE Task (id INTEGER PRIMARY KEY, name TEXT, image TEXT)',
      );
    },
  );
  return db;
}

Future fetchAllTasks(Database db) async {
  final List<Map> tasks = await db.rawQuery('SELECT * FROM Test');
}
