import 'package:sqflite/sqflite.dart';

class People_Table {
    final String TABLE_NAME = "People";

    final String PEOPLE_ID = "peopleid";
    final String PEOPLE_CODE = "peoplecode";
    final String PEOPLE_FULLNAME = "peoplename";
    final String PEOPLE_LOGINID = "loginid";
    final String PEOPLE_PASSWORD = "password";
    final String PEOPLE_SALT = "salt";
    final String PEOPLE_GENDER = "gender";
    final String PEOPLE_MOBILENO = "mobileno";
    final String PEOPLE_EMAIL = "email";
    final String PEOPLE_DOB = "dob";
    final String PEOPLE_DOJ = "doj";
    final String PEOPLE_DOR = "dor";
    //final String PEOPLE_ENABLE = "enable";
    final String PEOPLE_LOCATIONTRACKING = "locationtracking";
    final String PEOPLE_DEPARTMENT = "department";
    final String PEOPLE_DESGINATION = "designation";
    final String PEOPLE_TYPE = "peopletype";
    final String PEOPLE_REPORTTO = "reportto";
    final String PEOPLE_CUSER = "cuser";
    final String PEOPLE_CDTZ = "cdtz";
    final String PEOPLE_MUSER = "muser";
    final String PEOPLE_MDTZ = "mdtz";
    final String PEOPLE_BUID = "buid";
    final String PEOPLE_CAPTURE_M_LOG = "capturemlog";
    final String PEOPLE_M_LOG_SEND_TO = "mlogsendto";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $PEOPLE_ID INTEGER NOT NULL,
            $PEOPLE_CODE TEXT NOT NULL,
            $PEOPLE_LOGINID TEXT NOT NULL,
            $PEOPLE_PASSWORD TEXT NOT NULL,
            $PEOPLE_FULLNAME TEXT NOT NULL,
            $PEOPLE_GENDER TEXT NOT NULL,
            $PEOPLE_MOBILENO TEXT NOT NULL,
            $PEOPLE_EMAIL TEXT NOT NULL,
            $PEOPLE_DEPARTMENT INTEGER NOT NULL,
            $PEOPLE_DESGINATION INTEGER NOT NULL,
            $PEOPLE_TYPE INTEGER NOT NULL,
            $PEOPLE_SALT TEXT NOT NULL,
            $PEOPLE_DOB TEXT NOT NULL,
            $PEOPLE_DOJ TEXT NOT NULL,
            $PEOPLE_DOR TEXT NOT NULL,
            $PEOPLE_REPORTTO INTEGER NOT NULL,
            $PEOPLE_CUSER INTEGER NOT NULL,
            $PEOPLE_CDTZ TEXT NOT NULL,
            $PEOPLE_MUSER INTEGER NOT NULL,
            $PEOPLE_BUID INTEGER NOT NULL,
            $PEOPLE_MDTZ TEXT NOT NULL,
            $PEOPLE_CAPTURE_M_LOG INTEGER NOT NULL,
            $PEOPLE_M_LOG_SEND_TO TEXT NOT NULL,
            $PEOPLE_LOCATIONTRACKING TEXT NOT NULL
          )
          ''');
        print("--created people table--");

    }
}