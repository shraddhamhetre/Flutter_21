import 'package:sqflite/sqflite.dart';

class QuestionSetBelonging_Table {
    final String TABLE_NAME = "QsetBelonging";

    final String QUESTIONSETBELONGING_ID = "qsbid";
    final String QUESTIONSETBELONGING_ISMANDATORY = "ismandatory";
    final String QUESTIONSETBELONGING_SEQNO = "seqno";
    final String QUESTIONSETBELONGING_QUESTIONSETID = "questionsetid";
    final String QUESTIONSETBELONGING_QUESTIONID = "questionid";
    final String QUESTIONSETBELONGING_CDTZ = "cdtz";
    final String QUESTIONSETBELONGING_MDTZ = "mdtz";
    // final String QUESTIONSETBELONGING_ISDELETED="isdeleted";
    final String QUESTIONSETBELONGING_CUSER = "cuser";
    final String QUESTIONSETBELONGING_MUSER = "muser";
    final String QUESTIONSETBELONGING_MIN = "min";
    final String QUESTIONSETBELONGING_MAX = "max";
    final String QUESTIONSETBELONGING_ALERTON = "alerton";
    final String QUESTIONSETBELONGING_OPTION = "option";
    final String QUESTIONSETBELONGING_BUID = "buid";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String REAL_TYPE = "REAL";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $QUESTIONSETBELONGING_ID INTEGER NOT NULL,
            $QUESTIONSETBELONGING_ISMANDATORY TEXT NOT NULL,
            $QUESTIONSETBELONGING_SEQNO INTEGER NOT NULL,
            $QUESTIONSETBELONGING_CDTZ TEXT NOT NULL,
            $QUESTIONSETBELONGING_MDTZ TEXT NOT NULL,
            $QUESTIONSETBELONGING_CUSER INTEGER NOT NULL,
            $QUESTIONSETBELONGING_QUESTIONSETID INTEGER NOT NULL,
            $QUESTIONSETBELONGING_QUESTIONID INTEGER NOT NULL,
            $QUESTIONSETBELONGING_BUID INTEGER NOT NULL,
            $QUESTIONSETBELONGING_MIN TEXT NOT NULL,
            $QUESTIONSETBELONGING_MAX TEXT NOT NULL,
            $QUESTIONSETBELONGING_ALERTON TEXT NOT NULL,
            $QUESTIONSETBELONGING_OPTION TEXT NOT NULL,
            $QUESTIONSETBELONGING_MUSER INTEGER NOT NULL
          )
          ''');
        print("--created QsetBelonging table--");

    }
}