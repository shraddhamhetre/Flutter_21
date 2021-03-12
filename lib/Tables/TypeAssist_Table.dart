import 'package:sqflite/sqflite.dart';

class TypeAssist_Table {
    final String TABLE_NAME = "TypeAssist";

    final String TYPE_ASSIST_ID = "taid";
    final String TYPE_ASSIST_CODE = "tacode";
    final String TYPE_ASSIST_NAME = "taname";

    final String TYPE_ASSIST_TYPE = "tatype";
    final String TYPE_ASSIST_CUSER = "cuser";

    final String TYPE_ASSIST_CDTZ = "cdtz";
    final String TYPE_ASSIST_MUSER = "muser";
    final String TYPE_ASSIST_MDTZ = "mdtz";
    // final String TYPE_ASSIST_ISDELETED="isdeleted";
    final String TYPE_ASSIST_PARENT = "parent";
    final String TYPE_ASSIST_BUID = "buid";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $TYPE_ASSIST_ID INTEGER NOT NULL,
            $TYPE_ASSIST_CODE TEXT NOT NULL,
            $TYPE_ASSIST_NAME TEXT NOT NULL,
            $TYPE_ASSIST_TYPE TEXT NOT NULL,
            $TYPE_ASSIST_CUSER INTEGER NOT NULL,
            $TYPE_ASSIST_CDTZ TEXT NOT NULL,
            $TYPE_ASSIST_MUSER INTEGER NOT NULL,
            $TYPE_ASSIST_BUID INTEGER NOT NULL,
            $TYPE_ASSIST_MDTZ TEXT NOT NULL,
            $TYPE_ASSIST_PARENT INTEGER NOT NULL
          )
          ''');
        print("--created TYPEASSIST table--");

    }
}