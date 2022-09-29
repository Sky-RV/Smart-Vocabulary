import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dictionary/Models/Languages_Model.dart';

class Language_DbProvider {

  Language_DbProvider._();

  static final Language_DbProvider language_db = Language_DbProvider._();
  late Database _database;

  Future<Database> get database async{
    _database = await initDB();
    return _database;
  }

  initDB() async{
    return await openDatabase(
      join(await getDatabasesPath(), "SmartVocabulary.db"),
      onCreate: (db, v) async{
        await db.execute(
          "CREATE TABLE Language_Table (Language_ID INTEGER PRIMARY KEY AUTOINCREMENT, "
              "lanFrom VARCHAR(100), lanTo VARCHAR(100))"
        );
      },
      version: 1
    );
  }

  Insert_Language(Languages_Model lan) async {
    final db = await database;
    var res = db.rawInsert(
      "INSERT INTO Language_Table (lanFrom, lanTo)"
          "VALUES (?, ?)",
      [lan.lanFrom, lan.lanTo]
    );
    return res;
  }

  Future<int> Remove_Language(int? id) async{
    final db = await database;
    var res = db.rawDelete(
      "DELETE FROM Language_Table WHERE Language_ID = ?",
      [id]
    );
    return res;
  }

  Future<List<Languages_Model>> List_Language() async{
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM Language_Table");
    List<Languages_Model> languages = [];

    res.forEach((element) {
      Map map = element;

      int id = map["Languages_ID"];
      String lanFrom = map["lanFrom"];
      String lanTo = map["lanTo"];

      var language = Languages_Model(
        ID: id,
        lanFrom: lanFrom,
        lanTo: lanTo
      );

      languages.add(language);
    });

    return languages;
  }

}