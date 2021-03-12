import 'package:sqflite/sqflite.dart';

class Question_Table {
    final String TABLE_NAME = "Question";

    final String QUESTION_ID = "questionid";
    final String QUESTION_NAME = "questionname";
    final String QUESTION_TYPE = "type";
    final String QUESTION_OPTIONS = "options";
    final String QUESTION_UNIT = "unit";
    final String QUESTION_MIN = "min";
    final String QUESTION_MAX = "max";
    final String QUESTION_ALERTON = "alertOn";
    final String QUESTION_CUSER = "cuser";
    final String QUESTION_CDTZ = "cdtz";
    final String QUESTION_MUSER = "muser";
    final String QUESTION_MDTZ = "mdtz";
    // final String QUESTION_ISDELETED="isDeleted";
    final String QUESTION_BUID = "buid";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "integer";
    final String REAL_TYPE = "REAL";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $QUESTION_ID INTEGER NOT NULL,
            $QUESTION_NAME TEXT NOT NULL,
            $QUESTION_TYPE INTEGER NOT NULL,
            $QUESTION_OPTIONS TEXT NOT NULL,
            $QUESTION_UNIT INTEGER NOT NULL,
            $QUESTION_MIN TEXT NOT NULL,
            $QUESTION_MAX TEXT NOT NULL,
            $QUESTION_ALERTON TEXT NOT NULL,
            $QUESTION_CUSER INTEGER NOT NULL,
            $QUESTION_CDTZ TEXT NOT NULL,
            $QUESTION_MUSER INTEGER NOT NULL,
            $QUESTION_BUID INTEGER NOT NULL,
            $QUESTION_MDTZ TEXT NOT NULL
          )
          ''');
        print("--created Question table--");

    }
}