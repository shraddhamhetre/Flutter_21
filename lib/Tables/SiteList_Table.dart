import 'package:sqflite/sqflite.dart';

class SiteList_Table {
    final String TABLE_NAME = "Sites";

    final String SITE_PEOPLE_BUILD = "buid";
    final String BU_CODE = "bucode";
    final String BU_NAME = "buname";

    final String BU_TYPE = "butype";
    final String BU_TYPENAME = "butypename";
    final String SITE_ENABLE = "enable";
    final String SITE_INCHARGE = "incharge";

    final String SITE_PEOPLE_CUSER = "cuser";
    final String SITE_PEOPLE_MUSER = "muser";
    final String SITE_PEOPLE_CDTZ = "cdtz";
    final String SITE_PEOPLE_MDTZ = "mdtz";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $SITE_PEOPLE_BUILD INTEGER NOT NULL,
            $SITE_PEOPLE_CUSER INTEGER NOT NULL,
            $SITE_PEOPLE_MUSER INTEGER NOT NULL,
            $SITE_PEOPLE_CDTZ TEXT NOT NULL,
            $SITE_PEOPLE_MDTZ TEXT NOT NULL,
            $SITE_ENABLE TEXT NOT NULL,
            $BU_TYPE INTEGER NOT NULL,
            $BU_TYPENAME TEXT NOT NULL,
            $SITE_INCHARGE TEXT NOT NULL,
            $BU_CODE TEXT NOT NULL,
            $BU_NAME TEXT NOT NULL
          )
          ''');
        print("--created Site table--");

    }
}