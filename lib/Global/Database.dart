import 'dart:io';

import 'package:intelliwiz21/Tables/AssetDetail_Table.dart';
import 'package:intelliwiz21/Tables/AssignedSitePeople_Table.dart';
import 'package:intelliwiz21/Tables/Geofence_Table.dart';
import 'package:intelliwiz21/Tables/Group_Table.dart';
import 'package:intelliwiz21/Tables/JobneedDetails_Table.dart';
import 'package:intelliwiz21/Tables/Jobneed_Table.dart';
import 'package:intelliwiz21/Tables/PeopleGroupBelong_Table.dart';
import 'package:intelliwiz21/Tables/People_Table.dart';
import 'package:intelliwiz21/Tables/QuestionSetBelong_Table.dart';
import 'package:intelliwiz21/Tables/QuestionSet_Table.dart';
import 'package:intelliwiz21/Tables/Question_Table.dart';
import 'package:intelliwiz21/Tables/SiteList_Table.dart';
import 'package:intelliwiz21/Tables/SitesInfo_Table.dart';
import 'package:intelliwiz21/Tables/TemplateList_Table.dart';
import 'package:intelliwiz21/Tables/TypeAssist_Table.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

import '../Tables/Address_Table.dart';

class DatabaseHelper {

    static final _databaseName = "intelliwiz.db";
    static final _databaseVersion = 1;
    static final table = 'my_table';

    static final columnId = '_id';
    static final columnName = 'name';
    static final columnAge = 'age';

    // make this a singleton class
    DatabaseHelper._privateConstructor();
    static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

    final asset = AssetDetail_Table();
    final jobneed = JOBNeed_Table();
    final jnd = JOBNeedDetails_Table();
    final typeAssist = TypeAssist_Table();
    final Geofence = Geofence_Table();
    final people = People_Table();
    final pgroup = Group_Table();
    final question= Question_Table();
    final qset = QuestionSet_Table();
    final qsetBelong = QuestionSetBelonging_Table();
    final pgbelong = PeopleGroupBelonging_Table();
    final site = SiteList_Table();
    //final ticket = T;
    final address = Address_Table();
    //final othersite = ;
    final siteinfo = SitesInfo_Table();
    final template = TemplateList_Table();
    final assignedsitepeople = AssignedSitePeople_Table();



    // only have a single app-wide reference to the database
    static Database _database;

    Future<Database> get database async {

        print("Database ==== 1");
        if (_database != null) return _database;
        // lazily instantiate the db the first time it is accessed
        _database = await _initDatabase();

        print("Database ==== 111");

        return _database;
    }

    // this opens the database (and creates it if it doesn't exist)
    _initDatabase() async {
        print("Database ==== 2");

        Directory documentsDirectory = await getApplicationDocumentsDirectory();
        String path = join(documentsDirectory.path, _databaseName);

        print("Database Path : "+ path);
        return await openDatabase(path,
            version: _databaseVersion,
            onCreate: _onCreate1);

    }

    // SQL code to create the database table
    Future _onCreate1(Database db, int version) async {
        print("Database ==== 3");


        await CreateTables(db);

    }

    Future CreateTables(Database db)async{
        print("Database ==== 4");

        await asset.OnCreate(db);
        await jobneed.OnCreate(db);
        await jnd.OnCreate(db);
        await typeAssist.OnCreate(db);
        await Geofence.OnCreate(db);
        await people.OnCreate(db);
        await pgroup.OnCreate(db);
        await pgbelong.OnCreate(db);
        await question.OnCreate(db);
        await qset.OnCreate(db);
        await qsetBelong.OnCreate(db);
        await site.OnCreate(db);
        await address.OnCreate(db);
        await siteinfo.OnCreate(db);
        await template.OnCreate(db);
        await assignedsitepeople.OnCreate(db);

    }

    Future<int> insert1(table,sql) async {

        //print("Table Name"+ table + " = : "+ sql);
        Database db = await instance.database;

        return await db.rawInsert(sql);
    }


    Future<int> insert(table, Map<String, dynamic> test) async {

        print("Table Name"+ table + " = "+ test.length.toString());
        Database db = await instance.database;


        return await db.insert(table, test);
    }

    // All of the rows are returned as a list of maps, where each map is
    // a key-value list of columns.
    Future<List<Map<String, dynamic>>> queryAllRows() async {
        Database db = await instance.database;
        return await db.query(table);
    }

    // All of the methods (insert, query, update, delete) can also be done using
    // raw SQL commands. This method uses a raw query to give the row count.
    Future<int> queryRowCount(tablename) async {
        
        print("count= :"+ tablename);
        Database db = await instance.database;


        return Sqflite.firstIntValue(await db.rawQuery('SELECT COUNT(*) FROM $tablename'))as int;
    }

    // We are assuming here that the id column in the map is set. The other
    // column values will be used to update the row.
    Future<int> update(Map<String, dynamic> row) async {
        Database db = await instance.database;
        int id = row[columnId];
        return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
    }
    Future<List> getAllRecords(String dbTable) async {
        Database db = await instance.database;
        var result = await db.rawQuery("SELECT * FROM $dbTable");

        print("Result list : "+ result.length.toString());

        return result.toList();
    }

    // Deletes the row specified by the id. The number of affected rows is
    // returned. This should be 1 as long as the row exists.
    Future<int> delete(int id) async {
        Database db = await instance.database;
        return await db.delete(table, where: '$columnId = ?', whereArgs: [id]);
    }
}