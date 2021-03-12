import 'package:sqflite/sqflite.dart';

class SitesVisitedLog_Table {
    final String TABLE_NAME = "SiteVisitedLog";

    final String SITEVISITEDLOG_PUNCHSTATUS = "punchstatus";
    final String SITEVISITEDLOG_PUNCHTIME = "punchtime";
    final String SITEVISITEDLOG_BUID = "buid";
    final String SITEVISITEDLOG_BUCODE = "bucode";
    final String SITEVISITEDLOG_BUNAME = "buname";
    final String SITEVISITEDLOG_OTHERSITE = "remarks";
    final String SITEVISITEDLOG_FROM = "from";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $SITEVISITEDLOG_PUNCHSTATUS TEXT NOT NULL,
            $SITEVISITEDLOG_PUNCHTIME TEXT NOT NULL,
            $SITEVISITEDLOG_BUID INTEGER NOT NULL,
            $SITEVISITEDLOG_BUCODE TEXT NOT NULL,
            $SITEVISITEDLOG_OTHERSITE TEXT NOT NULL,
            $SITEVISITEDLOG_BUNAME TEXT NOT NULL
          )
          ''');
    }
}