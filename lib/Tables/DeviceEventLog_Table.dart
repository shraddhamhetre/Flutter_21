
import 'package:sqflite/sqflite.dart';

class DeviceEventLog_Table {
    final String TABLE_NAME = "DeviceEventLog";

    final String DEVICEEVENT_LOGID = "deviceeventlogid";
    final String DEVICEEVENT_IMEI = "deviceid";
    final String DEVICEEVENT_EVENTVALUE = "eventvalue";
    final String DEVICEEVENT_GPS_LOCATION = "gpslocation";
    final String DEVICEEVENT_ACCURACY = "accuracy";
    final String DEVICEEVENT_ALTITUDE = "altitude";
    final String DEVICEEVENT_BATTERYLEVEL = "batterylevel";
    final String DEVICEEVENT_SIGNALSTRENGTH = "signalstrength";
    final String DEVICEEVENT_AVAILEXTERNALMEMORY = "availextmemory";
    final String DEVICEEVENT_AVAILINTERNALMEMORY = "availintmemory";
    final String DEVICEEVENT_EVENTTYPE = "eventtype";
    final String DEVICEEVENT_PEOPLEID = "peopleid";

    final String DEVICEEVENT_CUSER = "cuser";
    final String DEVICEEVENT_MUSER = "muser";
    final String DEVICEEVENT_CDTZ = "cdtz";
    final String DEVICEEVENT_MDTZ = "mdtz";

    final String DEVICEEVENT_BADNWIDTHSIGNAL = "signalbandwidth";
    final String DEVICEEVENT_SYNCSTATUS = "syncStatus";
    // final String DEVICEEVENT_ISDELETED="isdeleted";
    final String DEVICEEVENT_BUID = "buid";

    final String DEVICEEVENT_ANDROID_VERSION = "androidosversion";
    final String DEVICEEVENT_APPLICATION_VERSION = "applicationversion";
    final String DEVICEEVENT_MODEL_NAME = "modelname";
    final String DEVICEEVENT_INSTALLED_APPS = "installedapps";

    final String DEVICEEVENT_SIM_NUMBER = "simserialnumber";
    final String DEVICEEVENT_LINE_NUMBER = "linenumber";
    final String DEVICEEVENT_NETWORK_PROVIDER_NAME = "networkprovidername";

    final String DEVICEEVENT_STEP_COUNT = "stepCount";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "integer";
    final String REAL_TYPE = "Real";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $DEVICEEVENT_LOGID INTEGER NOT NULL,
            $DEVICEEVENT_PEOPLEID INTEGER NOT NULL,
            $DEVICEEVENT_IMEI INTEGER NOT NULL,
            $DEVICEEVENT_EVENTTYPE INTEGER NOT NULL,
            $DEVICEEVENT_EVENTVALUE TEXT NOT NULL,
            $DEVICEEVENT_GPS_LOCATION TEXT NOT NULL,
            $DEVICEEVENT_ACCURACY TEXT NOT NULL,
            $DEVICEEVENT_ALTITUDE TEXT NOT NULL,
            $DEVICEEVENT_BATTERYLEVEL TEXT NOT NULL,
            $DEVICEEVENT_SIGNALSTRENGTH TEXT NOT NULL,
            $DEVICEEVENT_AVAILEXTERNALMEMORY TEXT NOT NULL,
            $DEVICEEVENT_AVAILINTERNALMEMORY TEXT NOT NULL,
            $DEVICEEVENT_BADNWIDTHSIGNAL TEXT NOT NULL,
            $DEVICEEVENT_CUSER INTEGER NOT NULL,
            $DEVICEEVENT_MUSER INTEGER NOT NULL,
            $DEVICEEVENT_CDTZ TEXT NOT NULL,
            $DEVICEEVENT_SYNCSTATUS TEXT NOT NULL,
            $DEVICEEVENT_BUID INTEGER NOT NULL,
            $DEVICEEVENT_ANDROID_VERSION TEXT NOT NULL,
            $DEVICEEVENT_APPLICATION_VERSION TEXT NOT NULL,
            $DEVICEEVENT_MODEL_NAME TEXT NOT NULL,
            $DEVICEEVENT_INSTALLED_APPS TEXT NOT NULL,
            $DEVICEEVENT_SIM_NUMBER TEXT NOT NULL,
            $DEVICEEVENT_LINE_NUMBER TEXT NOT NULL,
            $DEVICEEVENT_NETWORK_PROVIDER_NAME TEXT NOT NULL,
            $DEVICEEVENT_STEP_COUNT TEXT NOT NULL,
            $DEVICEEVENT_MDTZ TEXT NOT NULL
          )
          ''');
    }
}