import 'package:sqflite/sqflite.dart';

class AttendanceHistory_Table {
    final String TABLE_NAME = "AttendanceHistoyTable";

    final String ATTENDANCEHISOTY_PELOGID = "pelogid";
    final String ATTENDANCEHISOTY_PEOPLECODE = "peopleid";
    final String ATTENDANCEHISOTY_DATETIME = "datetime";
    final String ATTENDANCEHISOTY_CUSER = "cuser";
    final String ATTENDANCEHISOTY_PUNCHSTATUS = "punchstatus";
    final String ATTENDANCEHISOTY_PUNCHTYPE = "punchtype";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
            CREATE TABLE $TABLE_NAME (
            $ATTENDANCEHISOTY_PELOGID INTEGER NOT NULL,
            $ATTENDANCEHISOTY_PEOPLECODE TEXT NOT NULL,
            $ATTENDANCEHISOTY_DATETIME TEXT NOT NLL,
            $ATTENDANCEHISOTY_CUSER INTEGER NOT NULL,
            $ATTENDANCEHISOTY_PUNCHTYPE INTEGER NOT NULL,
            $ATTENDANCEHISOTY_PUNCHSTATUS INTEGER NOT NULL
            )
            ''');
        print("--created AttendanceHistoyTable table--");

    }
}