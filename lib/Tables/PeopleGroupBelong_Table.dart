import 'package:sqflite/sqflite.dart';

class PeopleGroupBelonging_Table {
    final String TABLE_NAME = "PeopleGroupBelonging";

    final String PGB_ID = "pgbid";
    final String PGB_GROUPID = "groupid";
    final String PGB_PEOPLEID = "peopleid";
    final String PGB_ISGROUPLEAD = "isgrouplead";
    final String PGB_CUSER = "cuser";
    final String PGB_CDTZ = "cdtz";
    final String PGB_MUSER = "muser";
    final String PGB_MDTZ = "mdtz";
    // final String PGB_ISDELETED="isdeleted";
    final String PGB_BUID = "buid";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";

    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $PGB_ID INTEGER NOT NULL,
            $PGB_GROUPID INTEGER NOT NULL,
            $PGB_PEOPLEID INTEGER NOT NULL,
            $PGB_ISGROUPLEAD TEXT NOT NULL,
            $PGB_CUSER INTEGER NOT NULL,
            $PGB_CDTZ TEXT NOT NULL,
            $PGB_MUSER INTEGER NOT NULL,
            $PGB_BUID INTEGER NOT NULL,
            $PGB_MDTZ TEXT NOT NULL
          )
          ''');
        print("--created PeopleGroupBelonging table--");

    }
}