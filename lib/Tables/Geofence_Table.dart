import 'package:sqflite/sqflite.dart';

class Geofence_Table {
    final String TABLE_NAME = "Geofence";

    final String GEOFENCE_ID = "gfid";
    final String GEOFENCE_CODE = "gfcode";
    final String GEOFENCE_NAME = "gfname";
    final String GEOFENCE_GEOFENCE_POINTS = "geofence";
    final String GEOFENCE_ENABLE = "enable";

    final String GEOFENCE_PEOPLEID = "peopleid";
    final String GEOFENCE_FROMDATE = "fromdt";

    final String GEOFENCE_UPTODATE = "uptodt";
    final String GEOFENCE_IDENTIFIER = "identifier";
    final String GEOFENCE_STARTTIME = "starttime";
    final String GEOFENCE_ENDTIME = "endtime";
    final String GEOFENCE_BUID = "buid";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $GEOFENCE_ID INTEGER NOT NULL,
            $GEOFENCE_CODE TEXT NOT NULL,
            $GEOFENCE_NAME TEXT NOT NULL,
            $GEOFENCE_GEOFENCE_POINTS TEXT NOT NULL,
            $GEOFENCE_PEOPLEID INTEGER NOT NULL,
            $GEOFENCE_FROMDATE TEXT NOT NULL,
            $GEOFENCE_UPTODATE TEXT NOT NULL,
            $GEOFENCE_ENABLE TEXT NOT NULL,
            $GEOFENCE_IDENTIFIER INTEGER NOT NULL,
            $GEOFENCE_STARTTIME TEXT NOT NULL,
            $GEOFENCE_BUID INTEGER NOT NULL,
            $GEOFENCE_ENDTIME TEXT NOT NULL
          )
          ''');
        print("--created geofence table--");

    }
}