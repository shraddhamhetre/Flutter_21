import 'package:sqflite/sqflite.dart';

class JOBNeed_Table {
    final String TABLE_NAME = "Jobneed";

    final String JOBNEED_ID = "jobneedid";
    final String JOBNEED_DESC = "jobdesc";
    final String JOBNEED_PLANDATETIME = "plandatetime";
    final String JOBNEED_EXPIRYDATETIME = "expirydatetime";
    final String JOBNEED_GRACETIME = "gracetime";
    final String JOBNEED_RECEIVEDONSERVER = "receivedonserver";
    final String JOBNEED_JOBSTARTTIME = "starttime";
    final String JOBNEED_JOBENDTIME = "endtime";
    final String JOBNEED_GPSLOCATION = "gpslocation";
    final String JOBNEED_REMARK = "remarks";
    final String JOBNEED_AATOP = "aatop";
    final String JOBNEED_ASSETID = "assetid";
    final String JOBNEED_FREQUENCY = "frequency";
    final String JOBNEED_JOBID = "jobid";
    final String JOBNEED_JOBSTATUS = "jobstatus";
    final String JOBNEED_JOBTYPE = "jobtype";
    final String JOBNEED_PERFORMEDBY = "performedby";
    final String JOBNEED_PRIORITY = "priority";
    final String JOBNEED_QSETID = "questionsetid";
    final String JOBNEED_SCANTYPE = "ScanType";
    final String JOBNEED_PEOPLEID = "peopleid";
    final String JOBNEED_GROUPID = "groupid";
    final String JOBNEED_IDENTIFIER = "identifier";
    final String JOBNEED_PARENT = "parent";
    final String JOBNEED_ISDELETED="isDeleted";
    final String JOBNEED_CUSER = "cuser";
    final String JOBNEED_MUSER = "muser";
    final String JOBNEED_CDTZ = "cdtz";
    final String JOBNEED_MDTZ = "mdtz";
    final String JOBNEED_TICKETNO = "ticketno";
    final String JOBNEED_BUID = "buid";
    final String JOBNEED_SEQNO = "seqno";
    final String JOBNEED_TICKETCATEGORY = "ticketcategory";
    final String JOBNEED_CDTZOFFSET = "ctzoffset";
    //final String JOBNEED_OTHERSITE = "othersite";
    final String JOBNEED_MFACTOR = "multiplicationfactor";

    final String JOBNEED_MFACTOR1 = "multiplicationfactor1";
    final String JOBNEED_MFACTOR2 = "multiplicationfactor2";

    final String JOBNEED_ATTACHMENTCOUNT = "attachmentcount";
    final String JOBNEED_SYNC_STATUS = "syncStatus";

    /*final String DATABASE_ALTER_JOBNEED_MFACTOR1 = "ALTER TABLE " +
        TABLE_NAME +
        " ADD COLUMN " +
        JOBNEED_MFACTOR1 +
        " real;";

    final String DATABASE_ALTER_JOBNEED_MFACTOR2 = "ALTER TABLE " +
        TABLE_NAME +
        " ADD COLUMN " +
        JOBNEED_MFACTOR2 +
        " real;";*/

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String REAL_TYPE = "real";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $JOBNEED_ID INTEGER NOT NULL,
            $JOBNEED_ASSETID INTEGER NOT NULL,
            $JOBNEED_DESC TEXT NOT NULL,
            $JOBNEED_FREQUENCY INTEGER NOT NULL,
            $JOBNEED_PLANDATETIME TEXT NOT NULL,
            $JOBNEED_EXPIRYDATETIME TEXT NOT NULL,
            $JOBNEED_GRACETIME INTEGER NOT NULL,
            $JOBNEED_JOBID INTEGER NOT NULL,
            $JOBNEED_QSETID INTEGER NOT NULL,
            $JOBNEED_AATOP INTEGER NOT NULL,
            $JOBNEED_JOBSTATUS INTEGER NOT NULL,
            $JOBNEED_JOBTYPE INTEGER NOT NULL,
            $JOBNEED_SCANTYPE INTEGER NOT NULL,
            $JOBNEED_RECEIVEDONSERVER TEXT NOT NULL,
            $JOBNEED_PRIORITY INTEGER NOT NULL,
            $JOBNEED_JOBSTARTTIME TEXT NOT NULL,
            $JOBNEED_JOBENDTIME  TEXT NOT NULL,
            $JOBNEED_PERFORMEDBY INTEGER NOT NULL,
            $JOBNEED_GPSLOCATION TEXT NOT NULL,
            $JOBNEED_REMARK TEXT NOT NULL,
            $JOBNEED_CUSER INTEGER NOT NULL,
            $JOBNEED_MUSER INTEGER NOT NULL,
            $JOBNEED_CDTZ TEXT NOT NULL,
            $JOBNEED_MDTZ TEXT NOT NULL,
            $JOBNEED_ATTACHMENTCOUNT TEXT NOT NULL,
            $JOBNEED_PEOPLEID INTEGER NOT NULL,
            $JOBNEED_GROUPID INTEGER NOT NULL,
            $JOBNEED_SYNC_STATUS TEXT NOT NULL,
            $JOBNEED_IDENTIFIER INTEGER NOT NULL,
            $JOBNEED_PARENT INTEGER NOT NULL,
            $JOBNEED_ISDELETED INTEGER NOT NULL,
            $JOBNEED_TICKETNO INTEGER NOT NULL,
            $JOBNEED_BUID INTEGER NOT NULL,
            $JOBNEED_SEQNO INTEGER NOT NULL,
            $JOBNEED_CDTZOFFSET INTEGER NOT NULL,
            $JOBNEED_MFACTOR TEXT NOT NULL,
          
            $JOBNEED_TICKETCATEGORY INTEGER NOT NULL
          )
          ''');
        print("--created jobneed table--");

    }
}