import 'package:sqflite/sqflite.dart';

class Group_Table {
    final String TABLE_NAME = "GroupTable";

    final String GROUP_ID = "groupid";
    final String GROUP_NAME = "groupname";
    final String GROUP_ENABLE = "enable";
    final String GROUP_CUSER = "cuser";
    final String GROUP_CDTZ = "cdtz";
    //  final String GROUP_ISDELETED="isdeleted";
    final String GROUP_MUSER = "muser";
    final String GROUP_MDTZ = "mdtz";
    final String GROUP_BUID = "buid";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $GROUP_ID INTEGER NOT NULL,
            $GROUP_NAME TEXT NOT NULL,
            $GROUP_ENABLE TEXT NOT NULL,
            $GROUP_CUSER INTEGER NOT NULL,
            $GROUP_CDTZ TEXT NOT NULL,
            $GROUP_MUSER INTEGER NOT NULL,
            $GROUP_MDTZ TEXT NOT NULL,
            $GROUP_BUID INTEGER NOT NULL
          )
          ''');
        print("--created pgroup table--");

    }
}