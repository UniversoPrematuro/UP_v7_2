// // ignore_for_file: unnecessary_null_comparison

// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// const String registerTable = "registerTable";
// const String idColumn = "idColumn";
// const String nameColumn = "nameColumn";
// const String birthColumn = "birthColumn";
// const String motherColumn = "motherColumn";
// const String gageColumn = "gageColumn";
// const String genderColumn = "genderColumn";
// const String userColumn = "userColumn";
// const String fotoColumn = "fotoColumn";
// const String dtRegColumn = "dtRegColumn";

// class RegisterHelper {
//   static final RegisterHelper _instance = RegisterHelper.internal();
//   factory RegisterHelper() => _instance;
//   RegisterHelper.internal();

//   late Database _db;

//   Future<Database> get db async {
//     if (_db != null) {
//       return _db;
//     } else {
//       _db = await initDb();
//       return _db;
//     }
//   }

//   Future<Database> initDb() async {
//     final databasePath = await getDatabasesPath();
//     final path = join(databasePath, "register3.db");

//     return await openDatabase(path, version: 1,
//         onCreate: (Database db, int newerVersion) async {
//       await db.execute(
//           "CREATE TABLE $registerTable($idColumn INTEGER PRIMARY KEY, $nameColumn TEXT,"
//           "$birthColumn TEXT, $motherColumn TEXT, $gageColumn INTEGER, "
//           "$genderColumn TEXT, $userColumn TEXT, $fotoColumn TEXT, $dtRegColumn TEXT)");
//     });
//   }

//   Future<Perfil?> saveMedia(Perfil? perfil) async {
//     Database dbPerfil = await db;
//     perfil!.id = await dbPerfil.insert(
//         registerTable, perfil.toMap() as Map<String, dynamic>);
//     return perfil;
//   }
// }

// class Perfil {
//   late int id;
//   late String name;
//   late String birth;
//   late String mother;
//   late int gage;
//   late String gender;
//   late String user;
//   late String foto;
//   late String dtReg;
//   Perfil();

//   Perfil.fromMap(Map map) {
//     id = map[idColumn];
//     name = map[nameColumn];
//     birth = map[birthColumn];
//     mother = map[motherColumn];
//     gage = map[gageColumn];
//     gender = map[genderColumn];
//     user = map[userColumn];
//     foto = map[fotoColumn];
//     dtReg = map[dtRegColumn];
//   }

//   Map toMap() {
//     Map<String, dynamic> map = {
//       nameColumn: name,
//       birthColumn: birth,
//       motherColumn: mother,
//       gageColumn: gage,
//       genderColumn: gender,
//       userColumn: user,
//       fotoColumn: foto,
//       dtRegColumn: dtReg
//     };
//     if (id == null) {
//       map[idColumn] = id;
//     }
//     return map;
//   }

//   @override
//   String toString() {
//     return "Perfil(id: $id, name: $name, birth: $birth, mother: $mother,"
//         " gage: $gage, gender: $gender, user: $user, foto: $foto, dtReg: $dtReg)";
//   }
// }
