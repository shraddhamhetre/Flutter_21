import 'package:sqflite/sqflite.dart';

class SitePerformTemplateList_Table {
    final String TABLE_NAME = "SitePerformTemplateList";

    final String TEMPLATE_ID = "templateId";
    final String TEMPLATE_PEOPLE = "templatePeople";
    final String TEMPLATE_SITEID = "templateSiteid";

    final String TEMPLATE_SITENAME = "templatesitename";
    final String TEMPLATE_CHECKIN_TIMESTAMP = "templatecheckintimestamp";

    final String TEMPLATE_QSETID = "templateqsetid";
    final String TEMPLATE_QSETNAME = "templateqsetname";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $TEMPLATE_ID INTEGER NOT NULL,
            $TEMPLATE_PEOPLE INTEGER NOT NULL,
            $TEMPLATE_SITEID INTEGER NOT NULL,
            $TEMPLATE_SITENAME TEXT NOT NULL,
            $TEMPLATE_CHECKIN_TIMESTAMP INTEGER NOT NULL,
            $TEMPLATE_QSETID INTEGER NOT NULL,
            $TEMPLATE_QSETNAME TEXT NOT NULL
          )
          ''');
    }
}