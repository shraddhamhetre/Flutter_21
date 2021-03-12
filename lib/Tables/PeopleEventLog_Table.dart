import 'package:sqflite/sqflite.dart';

class PeopleEventLog_Table {
    final String TABLE_NAME = "PeopleEventLog";

    final String PE_LOGID = "pelogid";

    final String PE_ACCURACY = "accuracy";
    final String PE_DEVICEID = "deviceid";
    final String PE_DATETIME = "datetime";
    final String PE_GPSLOCATION = "gpslocation";
    final String PE_PR_THRESHOLD = "photorecognitionthreshold";
    final String PE_PR_SCORE = "photorecognitionscore";
    final String PE_PR_TIMESTAMP = "photorecognitiontimestamp";
    final String PE_PR_RESPONSE = "photorecognitionserviceresponse";
    final String PE_FACEREGONITION = "facerecognition";

    final String PE_GFID = "gfid";
    // final String PE_ISDELETED="isdeleted";
    final String PE_PEOPLEID = "peopleid";
    final String PE_TYPE = "peventtype";
    final String PE_PUNCHSTATUS = "punchstatus";
    final String PE_VARIFIEDBY = "verifiedby";

    final String PE_CUSER = "cuser";
    final String PE_MUSER = "muser";
    final String PE_CDTZ = "cdtz";
    final String PE_MDTZ = "mdtz";
    final String PE_BUID = "buid";
    final String PE_SYNCSTATUS = "syncStatus";
    final String PE_SCAN_PEOPLECODE = "scanPeopleCode";

    final String PE_TRANSPORTMODE = "transportmode";
    final String PE_EXPENCES = "expamt";
    final String PE_DURATION = "duration";
    final String PE_DISTANCE = "distance";
    final String PE_REFERENCE = "reference";
    final String PE_REMARKS = "remarks";

    final String PE_OTHERLOCATION = "otherlocation";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String REAL_TYPE = "Real";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $PE_LOGID INTEGER NOT NULL,
            $PE_ACCURACY TEXT NOT NULL,
            $PE_DEVICEID INTEGER NOT NULL,
            $PE_DATETIME TEXT NOT NULL,
            $PE_GPSLOCATION TEXT NOT NULL,
            $PE_PR_THRESHOLD INTEGER NOT NULL,
            $PE_PR_SCORE TEXT NOT NULL,
            $PE_PR_TIMESTAMP TEXT NOT NULL,
            $PE_PR_RESPONSE TEXT NOT NULL,
            $PE_FACEREGONITION TEXT NOT NULL,
            $PE_PEOPLEID INTEGER NOT NULL,
            $PE_TYPE TEXT NOT NULL,
            $PE_PUNCHSTATUS TEXT NOT NULL,
            $PE_VARIFIEDBY INTEGER NOT NULL,
            $PE_SYNCSTATUS TEXT NOT NULL,
            $PE_BUID INTEGER NOT NULL,
            $PE_CUSER INTEGER NOT NULL,
            $PE_MUSER INTEGER NOT NULL,
            $PE_MDTZ TEXT NOT NULL,
            $PE_GFID INTEGER NOT NULL,
            $PE_SCAN_PEOPLECODE TEXT NOT NULL,
            $PE_TRANSPORTMODE INTEGER NOT NULL,
            $PE_EXPENCES TEXT NOT NULL,
            $PE_DURATION INTEGER NOT NULL,
            $PE_DISTANCE INTEGER NOT NULL,
            $PE_REFERENCE TEXT NOT NULL,
            $PE_REMARKS TEXT NOT NULL,
            $PE_OTHERLOCATION TEXT NOT NULL,
            $PE_CDTZ TEXT NOT NULL
          )
          ''');
    }
}