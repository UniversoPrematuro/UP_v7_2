// ignore_for_file: unnecessary_null_comparison

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String noticeTable = "noticeTable";
const String idColumn = "idColumn";
const String userColumn = "userColumn";
const String noticeColumn = "noticeColumn";
const String statusColumn = "statusColumn";
const String dateColumn = "dateColumn";
const String codeColumn = "codeColumn";

class NoticeHelper {
  static final NoticeHelper _instance = NoticeHelper.internal();
  factory NoticeHelper() => _instance;
  NoticeHelper.internal();

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
    final path = join(databasesPath, "noticenew6.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $noticeTable($idColumn INTEGER PRIMARY KEY, $userColumn TEXT,"
          "$noticeColumn TEXT, $statusColumn TEXT, $dateColumn TEXT, $codeColumn TEXT)");
    });
  }

  Future<Notice> saveNotice(Notice not) async {
    Database dbNot = await db;
    not.id =
        await dbNot.insert(noticeTable, not.toMap() as Map<String, dynamic>);
    return not;
  }

  Future<Notice?> getNot(int id) async {
    Database dbNot = await db;
    List<Map> maps = await dbNot.query(noticeTable,
        columns: [
          idColumn,
          userColumn,
          noticeColumn,
          statusColumn,
          dateColumn,
          codeColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Notice.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<Notice?> getUserNot(String user) async {
    Database dbNot = await db;
    List<Map> maps = await dbNot.query(noticeTable,
        columns: [
          idColumn,
          userColumn,
          noticeColumn,
          statusColumn,
          dateColumn,
          codeColumn
        ],
        where: "$userColumn = ?",
        whereArgs: [user]);
    if (maps.isNotEmpty) {
      return Notice.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List> getAllNots(String user) async {
    Database dbNot = await db;
    List<Map> maps = await dbNot.query(noticeTable,
        columns: [
          idColumn,
          userColumn,
          noticeColumn,
          statusColumn,
          dateColumn,
          codeColumn
        ],
        where: "$userColumn = ?",
        whereArgs: [user]);
    List<Notice> noticeList = [];
    for (Map m in maps) {
      noticeList.add(Notice.fromMap(m));
    }
    return noticeList;
  }

  Future<int> deletePerfil(int id) async {
    Database dbNot = await db;
    return await dbNot
        .delete(noticeTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<int> updatePerfil(Notice not) async {
    Database dbNot = await db;
    return await dbNot.update(noticeTable, not.toMap() as Map<String, dynamic>,
        where: "$idColumn = ?", whereArgs: [not.id]);
  }
}

class Notice {
  late int id;
  late String user;
  late String notice;
  late String status;
  late String date;
  late String code;

  Notice();

  Notice.fromMap(Map map) {
    id = map[idColumn];
    user = map[userColumn];
    notice = map[noticeColumn];
    status = map[statusColumn];
    date = map[dateColumn];
    code = map[codeColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      userColumn: user,
      noticeColumn: notice,
      statusColumn: status,
      dateColumn: date,
      codeColumn: code
    };
    if (id == null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Notice $id: $notice UID: $user, Status: $status, "
        "Date: $date, Code: $code";
  }
}
