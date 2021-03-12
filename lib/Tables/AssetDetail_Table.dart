import 'package:sqflite/sqflite.dart';

class AssetDetail_Table{

	final String TABLE_NAME= "AssetDetails";

	final Id = '_id';
	final String ASSET_ID="assetid";
	final String ASSET_CODE="assetcode";
	final String ASSET_NAME="assetname";
	final String ASSET_ENABLE="enable";
	final String ASSET_IS_CRITICAL="iscritical";
	final String ASSET_GPS_LOCATION="gpslocation";
	final String ASSET_PARENT="parent";
	final String ASSET_IDENTIFIER="identifier";
	final String ASSET_RUNNING_STATUS="runningstatus";

	final String ASSET_CUSER="cuser";
	final String ASSET_MUSER="muser";
	final String ASSET_CDTZ="cdtz";
	final String ASSET_IS_DELETED="isdeleted";
	final String ASSET_MDTZ="mdtz";
	final String ASSET_SYNC_STATUS="syncStatus";
	final String ASSET_BUID="buid";
	final String ASSET_LOCATION_CODE="loccode";
	final String ASSET_LOCATION_NAME="locname";

	final String ASSET_TYPE="type";
	final String ASSET_CATEGORY="category";
	final String ASSET_SUBCATEGORY="subcategory";
	final String ASSET_BRAND="brand";
	final String ASSET_MODEL="model";
	final String ASSET_SUPPLIER="supplier";
	final String ASSET_CAPACITY="capacity";
	final String ASSET_UNIT="unit";
	final String ASSET_YOM="yom";
	final String ASSET_MSN="msn";
	final String ASSET_BILLDATE="bdate";
	final String ASSET_PURCHACEDATE="pdate";
	final String ASSET_INSTALLATIONDATE="isdate";
	final String ASSET_BILLVALUE="billval";
	final String ASSET_SERVICE="service";
	final String ASSET_SERVICEPROVIDER="servprov";
	final String ASSET_SERVICEPROVIDER_NAME="servprovname";
	final String ASSET_SERVICEFROMDATE="sfdate";
	final String ASSET_SERVICETODATE="stdate";
	final String ASSET_METER="meter";
	final String ASSET_QSETIDS="qsetids";
	final String ASSET_QSETNAME="qsetname";
	final String ASSET_TEMPCODE="tempcode";
	final String ASSET_MFACTOR="multiplicationfactor";

	final String TEXT_TYPE="text";
	final String INT_TYPE="integer";
	final String REAL_TYPE="real";
	final String ID_TYPE="INTEGER PRIMARY KEY AUTOINCREMENT";



	OnCreate(Database db) async {
		await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $Id INTEGER PRIMARY KEY,
            $ASSET_ID INTEGER NOT NULL,
			$ASSET_ENABLE TEXT NOT NULL,
			$ASSET_PARENT INTEGER NOT NULL,
			$ASSET_CUSER INTEGER NOT NULL,
			$ASSET_MUSER INTEGER NOT NULL,
			$ASSET_CDTZ TEXT NOT NULL,
			$ASSET_IS_DELETED TEXT NOT NULL,
			$ASSET_CODE TEXT NOT NULL,
			$ASSET_MDTZ TEXT NOT NULL,
			$ASSET_NAME TEXT NOT NULL,
			$ASSET_IS_CRITICAL TEXT NOT NULL,
			$ASSET_GPS_LOCATION TEXT NOT NULL,
			$ASSET_IDENTIFIER INTEGER NOT NULL,
			$ASSET_SYNC_STATUS TEXT NOT NULL,
			$ASSET_BUID INTEGER NOT NULL,
			$ASSET_RUNNING_STATUS INTEGER NOT NULL,
			$ASSET_LOCATION_CODE TEXT NOT NULL,
			$ASSET_TYPE INTEGER NOT NULL,
			$ASSET_CATEGORY INTEGER NOT NULL,
			$ASSET_SUBCATEGORY INTEGER NOT NULL,
			$ASSET_BRAND INTEGER NOT NULL,
			$ASSET_MODEL INTEGER NOT NULL,
			$ASSET_SUPPLIER TEXT NOT NULL,
			$ASSET_CAPACITY TEXT NOT NULL,
			$ASSET_UNIT INTEGER NOT NULL,
			$ASSET_YOM TEXT NOT NULL,
			$ASSET_MSN TEXT NOT NULL,
			$ASSET_BILLDATE TEXT NOT NULL,
			$ASSET_PURCHACEDATE TEXT NOT NULL,
			$ASSET_INSTALLATIONDATE TEXT NOT NULL,
			$ASSET_BILLVALUE TEXT NOT NULL,
			$ASSET_SERVICEPROVIDER INTEGER NOT NULL,
			$ASSET_SERVICEPROVIDER_NAME TEXT NOT NULL,
			$ASSET_SERVICE INTEGER NOT NULL,
			$ASSET_SERVICEFROMDATE TEXT NOT NULL,
			$ASSET_SERVICETODATE TEXT NOT NULL,
			$ASSET_METER INTEGER NOT NULL,
			$ASSET_QSETIDS TEXT NOT NULL,
			$ASSET_QSETNAME TEXT NOT NULL,
			$ASSET_TEMPCODE TEXT NOT NULL,
			$ASSET_MFACTOR TEXT NOT NULL,
			$ASSET_LOCATION_NAME TEXT NOT NULL
          )
          ''');
		print("--created asset table--");

	}

}