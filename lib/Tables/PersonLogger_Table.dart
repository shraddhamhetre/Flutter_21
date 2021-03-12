import 'package:sqflite/sqflite.dart';

class PersonLogger_Table {
    final String TABLE_NAME = "PersonLogger";

    final String PLOGGER_ID = "personloggerid";
    final String PLOGGER_IDENTIFIER = "identifier";
    final String PLOGGER_PEOPLEID = "peopleid";
    final String PLOGGER_VISITORIDNO = "visitoridno";
    final String PLOGGER_FIRSTNAME = "firstname";
    final String PLOGGER_MIDDLENAME = "middlename";
    final String PLOGGER_LASTNAME = "lastname";
    final String PLOGGER_MOBILENO = "mobileno";
    final String PLOGGER_IDPROOFTYPE = "idprooftype";
    final String PLOGGER_CUSER = "cuser";
    final String PLOGGER_MUSER = "muser";
    final String PLOGGER_CDTZ = "cdtz";
    final String PLOGGER_MDTZ = "mdtz";
    final String PLOGGER_SYNC_STATUS = "syncStatus";
    final String PLOGGER_BUID = "buid";
    final String PLOGGER_PHOTOIDNO = "photoidno";
    final String PLOGGER_BELONGINGS = "belongings";
    final String PLOGGER_MEETINGPURPOSE = "meetingpurpose";
    final String PLOGGER_SCHEDULE_IN_TIME = "scheduledintime";
    final String PLOGGER_SCHEDULE_OUT_TIME = "scheduledouttime";
    final String PLOGGER_ACTUAL_IN_TIME = "actualintime";
    final String PLOGGER_ACTUAL_OUT_TIME = "actualouttime";
    final String PLOGGER_REFERENCEID = "referenceid";
    final String PLOGGER_DOB = "dob";
    final String PLOGGER_LOCALADDRESS = "localaddress";
    final String PLOGGER_NATIVEADDRESS = "nativeaddress";
    final String PLOGGER_QUALIFICATION = "qualification";
    final String PLOGGER_ENGLISH = "english";
    final String PLOGGER_CURRENTEMPLOYEMENT = "currentemployement";
    final String PLOGGER_LENGTHOFSERVICE = "lengthofservice";
    final String PLOGGER_HEIGHT = "heightincms";
    final String PLOGGER_WEIGHT = "weightinkgs";
    final String PLOGGER_WAIST = "waist";
    final String PLOGGER_ISHANDICAPPED = "ishandicapped";
    final String PLOGGER_IDENTIFICATIONMARK = "identificationmark";
    final String PLOGGER_PHYSICALCONDITION = "physicalcondition";
    final String PLOGGER_RELIGION = "religion";
    final String PLOGGER_CASTE = "caste";
    final String PLOGGER_MARITALSTATUS = "maritalstatus";

    final String PLOGGER_GENDER = "gender";
    final String PLOGGER_L_AREACODE = "lareacode";
    final String PLOGGER_ENABLE = "enable";
    final String PLOGGER_CLIENTID = "clientid";

    final String PLOGGER_N_AREACODE = "nareacode";
    final String PLOGGER_L_CITY = "lcity";
    final String PLOGGER_L_STATE = "lstate";
    final String PLOGGER_N_CITY = "ncity";
    final String PLOGGER_N_STATE = "nstate";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "integer";
    final String REAL_TYPE = "real";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $PLOGGER_ID INTEGER NOT NULL,
            $PLOGGER_IDENTIFIER INTEGER NOT NULL,
            $PLOGGER_PEOPLEID INTEGER NOT NULL,
            $PLOGGER_VISITORIDNO TEXT NOT NULL,
            $PLOGGER_FIRSTNAME TEXT NOT NULL,
            $PLOGGER_MIDDLENAME TEXT NOT NULL,
            $PLOGGER_LASTNAME TEXT NOT NULL,
            $PLOGGER_MOBILENO TEXT NOT NULL,
            $PLOGGER_IDPROOFTYPE INTEGER NOT NULL,
            $PLOGGER_CUSER INTEGER NOT NULL,
            $PLOGGER_MUSER INTEGER NOT NULL,
            $PLOGGER_CDTZ TEXT NOT NULL,
            $PLOGGER_MDTZ TEXT NOT NULL,
            $PLOGGER_SYNC_STATUS INTEGER NOT NULL,
            $PLOGGER_BUID INTEGER NOT NULL,
            $PLOGGER_PHOTOIDNO INTEGER NOT NULL,
            $PLOGGER_BELONGINGS TEXT NOT NULL,
            $PLOGGER_MEETINGPURPOSE TEXT NOT NULL,
            $PLOGGER_SCHEDULE_IN_TIME TEXT NOT NULL,
            $PLOGGER_SCHEDULE_OUT_TIME TEXT NOT NULL,
            $PLOGGER_ACTUAL_IN_TIME TEXT NOT NULL,
            $PLOGGER_ACTUAL_OUT_TIME TEXT NOT NULL,
            $PLOGGER_REFERENCEID TEXT NOT NULL,
            $PLOGGER_DOB TEXT NOT NULL,
            $PLOGGER_LOCALADDRESS TEXT NOT NULL,
            $PLOGGER_NATIVEADDRESS TEXT NOT NULL,
            $PLOGGER_QUALIFICATION TEXT NOT NULL,
            $PLOGGER_ENGLISH TEXT NOT NULL,
            $PLOGGER_CURRENTEMPLOYEMENT TEXT NOT NULL,
            $PLOGGER_LENGTHOFSERVICE TEXT NOT NULL,
            $PLOGGER_HEIGHT TEXT NOT NULL,
            $PLOGGER_WEIGHT TEXT NOT NULL,
            $PLOGGER_WAIST TEXT NOT NULL,
            $PLOGGER_ISHANDICAPPED INTEGER NOT NULL,
            $PLOGGER_IDENTIFICATIONMARK TEXT NOT NULL,
            $PLOGGER_PHYSICALCONDITION TEXT NOT NULL,
            $PLOGGER_RELIGION TEXT NOT NULL,
            $PLOGGER_CASTE TEXT NOT NULL,
            $PLOGGER_MARITALSTATUS TEXT NOT NULL,
            $PLOGGER_L_AREACODE TEXT NOT NULL,
            $PLOGGER_N_AREACODE TEXT NOT NULL,
            $PLOGGER_L_CITY TEXT NOT NULL,
            $PLOGGER_L_STATE INTEGER NOT NULL,
            $PLOGGER_N_CITY TEXT NOT NULL,
            $PLOGGER_N_STATE INTEGER NOT NULL,
            $PLOGGER_ENABLE TEXT NOT NULL,
            $PLOGGER_CLIENTID INTEGER NOT NULL,
            $PLOGGER_GENDER TEXT NOT NULL
          )
          ''');
    }
}