import 'package:sqflite/sqflite.dart';

class JOBNeedDetails_Table {
    final String TABLE_NAME = "JOBNeedDetails";

    final String JOBNEEDDETAILS_ID = "jndid";
    final String JOBNEEDDETAILS_JOBNEEDID = "jobneedid";
    final String JOBNEEDDETAILS_SEQNO = "seqno";
    final String JOBNEEDDETAILS_QUESTIONID = "questionid";
    final String JOBNEEDDETAILS_ANSWER = "Answer";
    final String JOBNEEDDETAILS_MIN = "Min";
    final String JOBNEEDDETAILS_MAX = "Max";
    final String JOBNEEDDETAILS_OPTION = "option";
    final String JOBNEEDDETAILS_ALERTON = "alerton";
    final String JOBNEEDDETAILS_TYPE = "type";
    final String JOBNEEDDETAILS_CDTZ = "cdtz";
    final String JOBNEEDDETAILS_MDTZ = "mdtz";
    final String JOBNEEDDETAILS_CUSER = "cuser";
    final String JOBNEEDDETAILS_MUSER = "muser";
    final String JOBNEEDDETAILS_ISMANATORY = "ismandatory";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String REAL_TYPE = "Real";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $JOBNEEDDETAILS_ID INTEGER NOT NULL,
            $JOBNEEDDETAILS_JOBNEEDID INTEGER NOT NULL,
            $JOBNEEDDETAILS_SEQNO INTEGER NOT NULL,
            $JOBNEEDDETAILS_QUESTIONID INTEGER NOT NULL,
            $JOBNEEDDETAILS_ANSWER TEXT NOT NULL,
            $JOBNEEDDETAILS_MIN TEXT NOT NULL,
            $JOBNEEDDETAILS_MAX TEXT NOT NULL,
            $JOBNEEDDETAILS_OPTION TEXT NOT NULL,
            $JOBNEEDDETAILS_TYPE INTEGER NOT NULL,
            $JOBNEEDDETAILS_CDTZ TEXT NOT NULL,
            $JOBNEEDDETAILS_MDTZ TEXT NOT NULL,
            $JOBNEEDDETAILS_CUSER INTEGER NOT NULL,
            $JOBNEEDDETAILS_MUSER INTEGER NOT NULL,
            $JOBNEEDDETAILS_ISMANATORY TEXT NOT NULL,
            $JOBNEEDDETAILS_ALERTON TEXT NOT NULL
          )
          ''');

       print("--created JND table--");
    }
}