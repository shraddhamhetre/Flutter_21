import 'package:sqflite/sqflite.dart';

class StepCountLog_Table {
    final String TABLE_NAME = "StepCountLog";

    final String STEPCOUNT_TIMESTAMP = "stepCountTimestamp";
    final String STEPCOUNT_STEPS = "stepCountSteps";
    final String STEPCOUNT_TOTALSTEPS = "stepCountTotalSteps";
    final String STEPCOUNT_STEPS_TAKEN = "stepCountStepsTaken";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $STEPCOUNT_TIMESTAMP INTEGER NOT NULL,
            $STEPCOUNT_STEPS TEXT NOT NULL,
            $STEPCOUNT_STEPS_TAKEN TEXT NOT NULL,
            $STEPCOUNT_TOTALSTEPS TEXT NOT NULL
          )
          ''');
    }
}