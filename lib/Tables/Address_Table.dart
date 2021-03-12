import 'package:sqflite/sqflite.dart';

 class Address_Table{
     
    final String TABLE_NAME= "Address";

    final String ADDRESS_ID="addressid";
    final String ADDRESS_ADDRESS="address";
    final String ADDRESS_LANDMARK="landmark";
    final String ADDRESS_POSTALCODE="postalcode";
    final String ADDRESS_MOBILENO="mobileNo";
    final String ADDRESS_PHONENO="phoneNo";
    final String ADDRESS_FAXNO="faxNo";
    final String ADDRESS_WEBSITE="website";
    final String ADDRESS_EMAIL="email";
    final String ADDRESS_GPSLOCATION="gpslocation";
    final String ADDRESS_TYPE="addressType";
    final String ADDRESS_CITY="city";
    final String ADDRESS_COUNTRY="country";
    final String ADDRESS_PEOPLEID="peopleid";
    final String ADDRESS_SITEID="siteid";
    final String ADDRESS_STATE="state";
    final String ADDRESS_ASSETID="assetid";
    final String ADDRESS_BUID="buid";

    final String ADDRESS_CUSER="cuser";
    final String ADDRESS_MUSER="muser";
    final String ADDRESS_CDTZ="cdtz";
    final String ADDRESS_MDTZ="mdtz";

    final String TEXT_TYPE="text";
    final String INT_TYPE="integer";
    final String ID_TYPE="INTEGER PRIMARY KEY AUTOINCREMENT";



    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $ADDRESS_ID INTEGER NOT NULL,
            $ADDRESS_PEOPLEID INTERGER NOT NULL,
            $ADDRESS_SITEID INTEGER NOT NULL,
            $ADDRESS_TYPE INTEGER NOT NULL,
            $ADDRESS_ADDRESS TEXT NOT NULL,
            $ADDRESS_LANDMARK TEXT NOT NULL,
            $ADDRESS_COUNTRY INTEGER NOT NULL,
            $ADDRESS_STATE INTEGER NOT NULL,
            $ADDRESS_CITY INTEGER NOT NULL,
            $ADDRESS_POSTALCODE TEXT NOT NULL,
            $ADDRESS_PHONENO TEXT NOT NULL,
            $ADDRESS_FAXNO TEXT NOT NULL,
            $ADDRESS_MOBILENO TEXT NOT NULL,
            $ADDRESS_WEBSITE TEXT NOT NULL,
            $ADDRESS_EMAIL TEXT NOT NULL,
            $ADDRESS_GPSLOCATION TEXT NOT NULL,
            $ADDRESS_CUSER INTEGER NOT NULL,
            $ADDRESS_MUSER INTEGER NOT NULL,
            $ADDRESS_CDTZ TEXT NOT NULL,
            $ADDRESS_MDTZ TEXT NOT NULL,
            $ADDRESS_ASSETID TEXT NOT NULL,
            $ADDRESS_BUID TEXT NOT NULL
          )
          ''');
        print("--created address table--");

    }

}