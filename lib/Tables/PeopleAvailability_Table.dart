import 'package:sqflite/sqflite.dart';

class PeopleAvailability_Table {
    final String TABLE_NAME = "PeopleAvailability";

    final String PA_ID = "paid";
    final String PA_AVAILABLEDATE = "availabledate";
    final String PA_SHIFTID = "shiftid";
    final String PA_PEOPLEID = "peopleid";
    // final String PA_ISDELETED="isdeleted";
    final String PA_CUSER = "cuser";
    final String PA_CDTZ = "cdtz";
    final String PA_MUSER = "muser";
    final String PA_MDTZ = "mdtz";
    final String PA_BUID = "buid";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $PA_ID INTEGER NOT NULL,
            $PA_AVAILABLEDATE TEXT NOT NULL,
            $PA_SHIFTID INTEGER NOT NULL,
            $PA_PEOPLEID INTEGER NOT NULL,
            $PA_CUSER INTEGER NOT NULL,
            $PA_CDTZ TEXT NOT NULL,
            $PA_MUSER INTEGER NOT NULL,
            $PA_BUID INTEGER NOT NULL,
            $PA_MDTZ TEXT NOT NULL
          )
          ''');
    }
}