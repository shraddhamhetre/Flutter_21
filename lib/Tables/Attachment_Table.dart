import 'package:sqflite/sqflite.dart';

class Attachment_Table{

    final String TABLE_NAME= "Attachment";

    final String ATTACHMENT_ID="attachmentid";
    final String ATTACHMENT_FILEPATH="FilePath";
    final String ATTACHMENT_FILENAME="FileName";
    final String ATTACHMENT_NARRATION="Narration";
    final String ATTACHMENT_GPSLOCATION="gpslocation";
    final String ATTACHMENT_DATETIME="datetime";
    final String ATTACHMENT_TYPE="AttachmentType";
    final String ATTACHMENT_CUSER="cuser";
    final String ATTACHMENT_MUSER="muser";
    final String ATTACHMENT_CDTZ="cdtz";
    final String ATTACHMENT_MDTZ="mdtz";
    //final String ATTACHMENT_ISDELETED ="isdeleted";
    final String ATTACHMENT_OWNERNAME ="ownername";
    final String ATTACHMENT_OWNERID ="ownerid";
    final String ATTACHMENT_SERVERPATH ="serverpath";
    final String ATTACHMENT_BUID="buid";
    final String ATTACHMENT_SYNC_STATUS="syncStatus";
    final String ATTACHMENT_CATEGORY="attachmentCategory";

    final String TEXT_TYPE="text";
    final String INT_TYPE="integer";
    final String ID_TYPE="INTEGER PRIMARY KEY AUTOINCREMENT";


    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $ATTACHMENT_ID INTEGER NOT NULL,
            $ATTACHMENT_OWNERNAME TEXT NOT NULL,
            $ATTACHMENT_OWNERID INTEGER NOT NULL,
            $ATTACHMENT_TYPE INTEGER NOT NULL,
            $ATTACHMENT_FILEPATH TEXT NOT NULL,
            $ATTACHMENT_FILENAME TEXT NOT NULL,
            $ATTACHMENT_NARRATION TEXT NOT NULL,
            $ATTACHMENT_GPSLOCATION TEXT NOT NULL,
            $ATTACHMENT_DATETIME TEXT NOT NULL,
            $ATTACHMENT_CUSER INTEGER NOT NULL,
            $ATTACHMENT_MUSER INTEGER NOT NULL,
            $ATTACHMENT_CDTZ TEXT NOT NULL,
            $ATTACHMENT_SYNC_STATUS TEXT NOT NULL,
            $ATTACHMENT_SERVERPATH TEXT NOT NULL,
            $ATTACHMENT_BUID INTEGER NOT NULL,
            $ATTACHMENT_CATEGORY INTEGER NOT NULL,
            $ATTACHMENT_MDTZ TEXT NOT NULL
          )
          ''');
        print("--created AssignedSitePeople table--");

    }

}