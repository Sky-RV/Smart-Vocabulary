import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:dictionary/Models/Vocabularies_Model.dart';

class Vocabulary_DbProvider{

  Vocabulary_DbProvider._();

  static final Vocabulary_DbProvider language_db = Vocabulary_DbProvider._();
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
              "CREATE TABLE Vocabulary_Table (Vocabulary_ID INTEGER PRIMARY KEY AUTOINCREMENT, "
                  "Original VARCHAR(100), Translate VARCHAR(100), Hint VARCHAR(100)"
                  "addTime TEXT, addDate TEXT, languageCode TEXT)"
          );
        },
        version: 1
    );
  }

  Insert_Vocabulary(Vocabularies_Model vocab) async {
    final db = await database;
    var res = db.rawInsert(
        "INSERT INTO Vocabulary_Table (Original, Translate, Hint, addTime, addDate, languageCode)"
            "VALUES (?, ?, ?, ?, ?, ?)",
        [vocab.Original, vocab.Translate, vocab.Hint, vocab.addTime, vocab.addDate, vocab.languageCode]
    );
    return res;
  }

  Future<int> Remove_Vocabulary(int? id) async{
    final db = await database;
    var res = db.rawDelete(
        "DELETE FROM Vocabulary_Table WHERE Vocabulary_ID = ?",
        [id]
    );
    return res;
  }

  Future<int> Clear_Vocabulary() async{
    final db = await database;
    var res = db.rawDelete(
        "DELETE FROM Vocabulary_Table"
    );
    return res;
  }

  Future<List<Vocabularies_Model>> List_Vocabularies() async{
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM Vocabulary_Table");
    List<Vocabularies_Model> vocabs = [];

    res.forEach((element) {
      Map map = element;

      int id = map["Vocabulary_ID"];
      String original = map["Original"];
      String translate = map["Translate"];
      String hint = map["Hint"];
      String time = map["addTime"];
      String date = map["addDate"];
      String lanCode = map["languageCode"];

      var vocab = Vocabularies_Model(
        ID: id,
        Original: original,
        Translate: translate,
        Hint: hint,
        addTime: time,
        addDate: date,
        languageCode: lanCode
      );

      vocabs.add(vocab);
    });

    return vocabs;
  }

  Future<List<Vocabularies_Model>> List_Vocabulary(int? code) async{
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM Vocabulary_Table WHERE languageCode = ?", [code]);
    List<Vocabularies_Model> vocabs = [];

    res.forEach((element) {
      Map map = element;

      int id = map["Vocabulary_ID"];
      String original = map["Original"];
      String translate = map["Translate"];
      String hint = map["Hint"];
      String time = map["addTime"];
      String date = map["addDate"];
      String lanCode = map["languageCode"];

      var vocab = Vocabularies_Model(
          ID: id,
          Original: original,
          Translate: translate,
          Hint: hint,
          addTime: time,
          addDate: date,
          languageCode: lanCode
      );

      vocabs.add(vocab);
    });

    return vocabs;
  }


}