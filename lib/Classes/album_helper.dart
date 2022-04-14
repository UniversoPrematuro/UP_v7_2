// ignore_for_file: unnecessary_null_comparison

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const String albumTable = "albumTable";
const String idColumn = "idColumn";
const String typeColumn = "typeColumn";
const String urlColumn = "urlColumn";
const String userColumn = "userColumn";
const String thumbNail = "thumbNail";
const String dateColumn = "dateColumn";

class AlbumHelper {
  static final AlbumHelper _instance = AlbumHelper.internal();
  factory AlbumHelper() => _instance;
  AlbumHelper.internal();

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
    final path = join(databasesPath, "albumnew4.db");

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $albumTable($idColumn INTEGER PRIMARY KEY, $typeColumn TEXT,"
          "$urlColumn TEXT, $userColumn TEXT, $thumbNail TEXT, $dateColumn TEXT)");
    });
  }

  Future<Media> saveMedia(Media album) async {
    Database dbAlbum = await db;
    album.id =
        await dbAlbum.insert(albumTable, album.toMap() as Map<String, dynamic>);
    return album;
  }

  Future<Media?> getMedia(int id) async {
    Database dbAlbum = await db;
    List<Map> maps = await dbAlbum.query(albumTable,
        columns: [
          idColumn,
          typeColumn,
          urlColumn,
          userColumn,
          thumbNail,
          dateColumn
        ],
        where: "$idColumn = ?",
        whereArgs: [id]);
    if (maps.isNotEmpty) {
      return Media.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<int> deleteMedia(int id) async {
    Database dbAlbum = await db;
    return await dbAlbum
        .delete(albumTable, where: "$idColumn = ?", whereArgs: [id]);
  }

  Future<List> getAllMedias() async {
    Database dbAlbum = await db;
    List listMap = await dbAlbum.rawQuery("SELECT * FROM $albumTable");
    List<Media> listAlbum = [];
    for (Map m in listMap) {
      listAlbum.add(Media.fromMap(m));
    }
    return listAlbum;
  }

  Future<List> getAllVideos(String uid) async {
    Database dbAlbum = await db;
    List listMap = await dbAlbum.query(albumTable,
        columns: [
          idColumn,
          typeColumn,
          urlColumn,
          userColumn,
          thumbNail,
          dateColumn
        ],
        where: "$typeColumn = ? AND $userColumn = ?",
        whereArgs: ['V', uid]);
    List<Media> listVideo = [];
    for (Map m in listMap) {
      listVideo.add(Media.fromMap(m));
    }
    return listVideo;
  }

  Future<List> getAllFotos(String user) async {
    Database dbAlbum = await db;
    List listMap = await dbAlbum.query(albumTable,
        columns: [
          idColumn,
          typeColumn,
          urlColumn,
          userColumn,
          thumbNail,
          dateColumn
        ],
        where: "$typeColumn = ? AND $userColumn = ?",
        whereArgs: ['F', user]);
    List<Media> listFoto = [];
    for (Map m in listMap) {
      listFoto.add(Media.fromMap(m));
    }
    return listFoto;
  }

  Future<int?> getQuantity() async {
    Database dbAlbum = await db;
    return Sqflite.firstIntValue(
        await dbAlbum.rawQuery("SELECT COUNT(*) FROM $albumTable"));
  }

  Future<int> getVideoQuant() async {
    Database dbAlbum = await db;
    List listMap = await dbAlbum.query(albumTable,
        columns: [idColumn, typeColumn, urlColumn, userColumn, thumbNail],
        where: "$typeColumn = ?",
        whereArgs: ['V']);
    return listMap.length;
  }

  Future<int> getFotoQuant() async {
    Database dbAlbum = await db;
    List listMap = await dbAlbum.query(albumTable,
        columns: [idColumn, typeColumn, urlColumn, userColumn],
        where: "$typeColumn = ?",
        whereArgs: ['F']);
    return listMap.length;
  }

  Future close() async {
    Database dbAlbum = await db;
    dbAlbum.close();
  }
}

class Media {
  late int id;
  late String type;
  late String url;
  late String user;
  late String thumb;
  late String date;

  Media();

  Media.fromMap(Map map) {
    id = map[idColumn];
    type = map[typeColumn];
    url = map[urlColumn];
    user = map[userColumn];
    thumb = map[thumbNail];
    date = map[dateColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      typeColumn: type,
      urlColumn: url,
      userColumn: user,
      thumbNail: thumb,
      dateColumn: date
    };
    if (id == null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Media $id => type: $type, url: $url, usr: $user, thumb: $thumb, date: $date";
  }
}
