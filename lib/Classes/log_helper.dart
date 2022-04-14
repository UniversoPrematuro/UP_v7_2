// ignore_for_file: unnecessary_null_comparison

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

late String logTable = "logTable";
late String idColumn = "idColumn";
late String dateColumn = "dateColumn";
late String pageColumn = "pageColumn";
late String timeColumn = "timeColumn";

class LogHelper {
  static final LogHelper _instance = LogHelper.internal();
  factory LogHelper() => _instance;
  LogHelper.internal();

  late Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "logtst1.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $logTable($idColumn INTEGER PRIMARY KEY, $dateColumn TEXT,"
          "$pageColumn TEXT, $timeColumn INTEGER)");
    });
  }
}
