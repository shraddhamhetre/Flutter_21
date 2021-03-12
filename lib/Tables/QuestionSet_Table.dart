import 'package:sqflite/sqflite.dart';

class QuestionSet_Table {
    final String TABLE_NAME = "QuestionSet";

    final String QUESTION_SET_ID = "questionsetid";
    final String QUESTION_SET_ASSETID = "assetid";
    final String QUESTION_SET_NAME = "qsetname";
    final String QUESTION_SET_SEQNO = "seqno";
    final String QUESTION_SET_ENABLE = "enable";
    final String QUESTION_SET_CUSER = "cuser";
    final String QUESTION_SET_CDTZ = "cdtz";
    final String QUESTION_SET_MUSER = "muser";
    final String QUESTION_SET_MDTZ = "mdtz";
    // final String QUESTION_SET_ISDELETED="isDeleted";
    final String QUESTION_SET_PARENT = "parent";
    final String QUESTION_SET_TYPE = "type";
    final String QUESTION_SET_BUID = "buid";
    final String QUESTION_SET_URL = "url";

    final String QUESTION_SET_ASSETINCLUDES = "assetincludes";
    final String QUESTION_SET_BUINCLUDES = "buincludes";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $QUESTION_SET_ID INTEGER NOT NULL,
            $QUESTION_SET_ASSETID INTEGER NOT NULL,
            $QUESTION_SET_NAME TEXT NOT NULL,
            $QUESTION_SET_ENABLE TEXT NOT NULL,
            $QUESTION_SET_CUSER INTEGER NOT NULL,
            $QUESTION_SET_CDTZ TEXT NOT NULL,
            $QUESTION_SET_MUSER INTEGER NOT NULL,
            $QUESTION_SET_MDTZ TEXT NOT NULL,
            $QUESTION_SET_SEQNO INTEGER NOT NULL,
            $QUESTION_SET_PARENT INTEGER NOT NULL,
            $QUESTION_SET_TYPE INTEGER NOT NULL,
            $QUESTION_SET_URL TEXT NOT NULL,
            $QUESTION_SET_BUID INTEGER NOT NULL
          )
          ''');
        print("--created QuestionSet table--");

    }
}