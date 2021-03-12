import 'package:sqflite/sqflite.dart';

class AssignedSitePeople_Table{

    final String TABLE_NAME= "AssignedSitePeople";

    final String PEOPLE_ID="peopleid";
    final String PEOPLE_CODE="peoplecode";
    final String PEOPLE_FULLNAME="peoplename";
    final String PEOPLE_MOBILENO="mobileno";
    final String PEOPLE_EMAIL="email";
    final String PEOPLE_DESGINATION="designationname";
    final String PEOPLE_SITES="sites";


    final String TEXT_TYPE="text";
    final String INT_TYPE="Integer";
    final String ID_TYPE="INTEGER PRIMARY KEY AUTOINCREMENT";



    OnCreate(Database db) async {
        await db.execute('''
          CREATE TABLE $TABLE_NAME (
            $PEOPLE_ID INTEGER NOT NULL,
            $PEOPLE_CODE TEXT NOT NULL,
            $PEOPLE_FULLNAME TEXT NOT NULL,
            $PEOPLE_MOBILENO TEXT NOT NULL,
            $PEOPLE_EMAIL TEXT NOT NULL,
            $PEOPLE_DESGINATION TEXT NOT NULL,
            $PEOPLE_SITES TEXT NOT NULL
          )
          ''');
        print("--created AssignedSitePeople table--");

    }

}