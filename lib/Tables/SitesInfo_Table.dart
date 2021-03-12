import 'package:sqflite/sqflite.dart';

class SitesInfo_Table {
    final String TABLE_NAME = "SitesInfo";

    final String SITE_INFO_CONTRACT = "contract";
    final String SITE_INFO_REVISION_NUMBER = "lrev";
    final String SITE_INFO_CONTRACTID = "contractid";

    final String SITE_INFO_CONTRACT_SDATE = "constartdate";
    final String SITE_INFO_CONTRACT_EDATE = "conenddate";

    final String SITE_INFO_INCHARGE = "sincharge";
    final String SITE_INFO_MOBILE = "simob";
    final String SITE_INFO_SITEID = "siteid";
    final String SITE_INFO_SITENAME = "site";
    final String SITE_INFO_SITEADDRESS = "address";

    final String SITE_INFO_SITELANDMARK = "landmark";
    final String SITE_INFO_POSTALCODE = "postalcode";

    final String SITE_INFO_SITEMOBILE = "mobileno";
    final String SITE_INFO_SITEGPS = "gpslocation";
    final String SITE_INFO_TOTALSTRENGTH = "totstrength";
    final String SITE_INFO_STRENGTH = "strength";

    final String TEXT_TYPE = "text";
    final String INT_TYPE = "Integer";
    final String ID_TYPE = "INTEGER PRIMARY KEY AUTOINCREMENT";

    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $SITE_INFO_CONTRACT TEXT NOT NULL,
            $SITE_INFO_REVISION_NUMBER INTEGER NOT NULL,
            $SITE_INFO_CONTRACTID INTEGER NOT NULL,
            $SITE_INFO_CONTRACT_SDATE TEXT NOT NULL,
            $SITE_INFO_CONTRACT_EDATE TEXT NOT NULL,
            $SITE_INFO_INCHARGE TEXT NOT NULL,
            $SITE_INFO_MOBILE TEXT NOT NULL,
            $SITE_INFO_SITEID INTEGER NOT NULL,
            $SITE_INFO_SITENAME TEXT NOT NULL,
            $SITE_INFO_SITEADDRESS TEXT NOT NULL,
            $SITE_INFO_SITELANDMARK TEXT NOT NULL,
            $SITE_INFO_POSTALCODE TEXT NOT NULL,
            $SITE_INFO_SITEMOBILE TEXT NOT NULL,
            $SITE_INFO_SITEGPS TEXT NOT NULL,
            $SITE_INFO_TOTALSTRENGTH INTEGER NOT NULL,
            $SITE_INFO_STRENGTH TEXT NOT NULL
          )
          ''');
        print("--created SiteInfo table--");

    }
}