import 'package:sqflite/sqflite.dart';

class CaptchaConfig_Table {
    final String TABLE_NAME = "CaptchaConfig";

    final String CAPTCHA_CONFIG_ID = "id";
    final String CAPTCHA_CONFIG_ENABLE = "enablesleepingguard";
    final String CAPTCHA_CONFIG_STARTTIME = "starttime";
    final String CAPTCHA_CONFIG_ENDTIME = "endtime";
    final String CAPTCHA_CONFIG_FREQUENCY = "captchafreq";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String BOOLEAN_TYPE = "boolean";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $CAPTCHA_CONFIG_ID INTEGER PRIMARY KEY,
            $CAPTCHA_CONFIG_ENABLE BOOL NOT NULL,
            $CAPTCHA_CONFIG_STARTTIME TEXT NOT NULL,
            $CAPTCHA_CONFIG_ENDTIME TEXT NOT NULL,
            $CAPTCHA_CONFIG_FREQUENCY INTEGER NOT NULL
          )
          ''');
    }
}