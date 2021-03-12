import 'package:sqflite/sqflite.dart';

class TemplateList_Table {
    final String TABLE_NAME = "Templates";

    final String TEMPLATE_QSETID = "questionsetid";
    final String TEMPLATE_QSETNAME = "qsetname";
    final String TEMPLATE_SITES = "sites";

    final String TEMPLATE_CUSER = "cuser";
    final String TEMPLATE_MUSER = "muser";
    final String TEMPLATE_CDTZ = "cdtz";
    final String TEMPLATE_MDTZ = "mdtz";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $TEMPLATE_QSETID INTEGER NOT NULL,
            $TEMPLATE_CUSER INTEGER NOT NULL,
            $TEMPLATE_MUSER INTEGER NOT NULL,
            $TEMPLATE_CDTZ TEXT NOT NULL,
            $TEMPLATE_MDTZ TEXT NOT NULL,
            $TEMPLATE_QSETNAME TEXT NOT NULL,
            $TEMPLATE_SITES TEXT NOT NULL
          )
          ''');
        print("--created Template table--");

    }
}