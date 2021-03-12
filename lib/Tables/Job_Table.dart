import 'package:sqflite/sqflite.dart';

class JOB_Table {
    final String TABLE_NAME = "JOB";

    final String JOB_CODE = "jobcode";
    final String JOB_DESC = "JobDesc";

    final String JOB_FROM = "from";
    final String JOB_UPTO = "upto";

    final String JOB_CRON = "cron";
    final String JOB_ASSETCODE = "assetcode";
    final String JOB_QSETNAME = "Qsetname";
    final String JOB_AATOP = "aatop";
    final String JOB_AATOG = "aatog";

    final String JOB_AAATOP = "aaatop";
    final String JOB_AAATOG = "aaatog";
    final String JOB_FREQUENCY = "frequency";
    final String JOB_PRIORITY = "priority";
    final String JOB_PLANDURATION = "planduration";

    final String JOB_EXPIRYTIME = "expirytime";
    final String JOB_GRACETIME = "gracetime";

    final String JOB_CUSER = "cuser";
    final String JOB_MUSER = "muser";
    final String JOB_CDTZ = "cdtz";
    final String JOB_MDTZ = "mdtz";

    final String TEXT_TYPE = "text";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $JOB_CODE TEXT NOT NULL,
            $JOB_DESC TEXT NOT NULL,
            $JOB_FROM TEXT NOT NULL,
            $JOB_UPTO TEXT NOT NULL,
            $JOB_CRON TEXT NOT NULL,
            $JOB_ASSETCODE TEXT NOT NULL,
            $JOB_QSETNAME TEXT NOT NULL,
            $JOB_AATOP TEXT NOT NULL,
            $JOB_AATOG TEXT NOT NULL,
            $JOB_AAATOP TEXT NOT NULL,
            $JOB_AAATOG TEXT NOT NULL,
            $JOB_FREQUENCY TEXT NOT NULL,
            $JOB_PRIORITY TEXT NOT NULL,
            $JOB_PLANDURATION TEXT NOT NULL,
            $JOB_EXPIRYTIME TEXT NOT NULL,
            $JOB_GRACETIME TEXT NOT NULL,
            $JOB_CUSER TEXT NOT NULL,
            $JOB_MUSER TEXT NOT NULL,
            $JOB_CDTZ TEXT NOT NULL,
            $JOB_MDTZ TEXT NOT NULL
          )
          ''');
    }
}