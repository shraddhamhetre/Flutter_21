import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:intelliwiz21/Models/Jobneed_DAO.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import '../Logout.dart';
import 'Database.dart';
import 'GlobalVariable.dart';
UserData userData;
Map<String, dynamic> test;
List JobneedArray =[];
List JobneedChildArray =[];
List JobneedChildArray1 = [];
StringBuffer jid;
String ss;

SharedPreferences prefs;
class Sync extends StatefulWidget
{
    @override
    Sync_State createState() => new Sync_State();

}

class Sync_State extends State<Sync> with SingleTickerProviderStateMixin{
    var userdata;
    List<Jobneed_DAO> JobneedList;
    int count = 0;

    final dbHelper = DatabaseHelper.instance;

    int _selectedIndex = 0;
    final _widgetOptions = [

        //Sync(),
        Text('Index 1: home'),
        Text('Index 3: panic'),
        Logout(),
    ];

    void _onItemTapped(int index) {

        print("===ontapped called"+ index.toString());
        setState(() {
            _selectedIndex = index;
        });
    }
    static const _tabCount = 6;
    TabController _tabController;

    @override
    void initState() {
        super.initState();
        _tabController = TabController(length: _tabCount, vsync: this);
        //getgetassetdetails();
        //getpeoplemodifiedafter();
        getjobneedmodifiedafter();
    }


    //SimData simData;

    getgetassetdetails ( ) async
    {
        print("getgetassetdetails==================");
        var deviceID;
        //simData = await SimService.getSimData;
        //print("==========--------"+simData.deviceId);
        //deviceID= simData.deviceId;
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query = "select * from getassetdetails('1970-01-01 13:53:39',"+ prefs.get('siteid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        //else{
        getresponse(userdata,"AssetDetails");
        getjobneedmodifiedafter();

    }
    getjobneedmodifiedafter()async{
        print("getjobneedmodifiedafter==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query = "select * from getjobneedmodifiedafter('1970-01-01 00:00:00', "+ prefs.get('peopleid')+", "+ prefs.get('siteid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "Jobneed");
        //gettypeassistmodifiedafter();
        //getjndmodifiedafter();
    }

    gettypeassistmodifiedafter()async{
        print("typeassist==================");
        prefs = await SharedPreferences.getInstance();
        /*'"+new DateTime.now().toString()+"'*/
        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from gettypeassistmodifiedafter('1970-01-01 09:44:17+00:00'," + prefs.get('clientid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');;
        userData.story = "1";
        print( userData.toJson( ));
        print( "========================" );
        getresponse(userdata, "TypeAssist");
        getpeoplemodifiedafter();

    }

    getpeoplemodifiedafter()async{
        print("getpeoplemodifiedafter==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query = "select * from getpeoplemodifiedafter('2018-02-14 13:53:39', "+ prefs.get('peopleid')+", " + prefs.get('clientid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "People");
        //getgroupsmodifiedafter();
    }

    getgroupsmodifiedafter()async{
        print("getgroupsmodifiedafter==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from getgroupsmodifiedafter('2018-02-14 13:53:39', "+ prefs.get('siteid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "Group");
        getquestionsmodifiedafter();
    }

    getquestionsmodifiedafter()async{
        print("getquestionsmodifiedafter==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from getquestionsmodifiedafter('1970-01-01 13:53:39', " + prefs.get('clientid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "Question");
        getquestionsetmodifiedafter();
    }

    getquestionsetmodifiedafter()async{
        print("getquestionsetmodifiedafter==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from getquestionsetmodifiedafter('1970-01-01 13:53:39', "+ prefs.get('siteid')+"," + prefs.get('clientid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "QuestionSet");
        getqsetbelongingmodifiedafter();
    }

    getqsetbelongingmodifiedafter()async{
        print("getqsetbelongingmodifiedafter==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from getqsetbelongingmodifiedafter('1970-01-01 00:00:00', "+ prefs.get('siteid')+"," + prefs.get('clientid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "QsetBelonging");
        getticketmodifiedafter();
    }

    getticketmodifiedafter()async{
        print("getticketmodifiedafter==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from getticketmodifiedafter('1970-01-01 00:00:00', "+ prefs.get('peopleid')+", "+ prefs.get('siteid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "ticket");
        getassetaddress();
    }

    getjndmodifiedafter()async{
        print("getjndmodifiedafter==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from getjndmodifiedafter('1970-01-01 00:00:00','"+ss+"' )";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "jnd");
        get_siteslist();

    }

    getpgbelonging()async{
        print("getpgbelonging==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from getpgbelonging(1970-01-01 00:00:00,"+ prefs.get('peopleid')+","+ prefs.get('siteid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "PeopleGroupBelonging");
        // get_siteslist();
    }

    get_people_template_list()async{
        print("get_people_template_list==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from get_people_template_list("+ prefs.get('clientid') +","+ prefs.get('peopleid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print("========================");
        getresponse(userdata, "Templates");
        //getjndmodifiedafter();
    }

    getassetaddress()async{
        print("get_address==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from getassetaddress('1970-01-01 00:00:00',"+ prefs.get('siteid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "Address");
        get_siteslist();
    }
    get_siteslist()async{
        print("get_siteslist==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from get_siteslist(" + prefs.get('clientid')+" , "+ prefs.get('peopleid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "Sites");
        get_siteinfo();
    }
    get_siteinfo()async{
        print("get_siteslist==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from get_siteinfo(" + prefs.get('clientid')+" , "+ prefs.get('peopleid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "SitesInfo");
        //get_people_template_list1();
    }

    get_people_template_list1()async{
        print("get_people_template_list1==================");
        prefs = await SharedPreferences.getInstance();

        userData = new UserData( );
        userData.servicename = "Select";
        userData.query    = "select * from get_people_template_list1(" + prefs.get('clientid')+" , "+ prefs.get('peopleid')+")";
        userData.sitecode = prefs.get('Sitecode');
        userData.loginid  = prefs.get('Username');
        userData.password = prefs.get('Userpassword');
        userData.tzoffset = "330";
        userData.deviceid = prefs.get('deviceid');
        userData.story = "1";
        print( userData.toJson( ) );
        print( "========================" );
        getresponse(userdata, "template");
        //getassetaddress();
    }


    getresponse(userdata, tablename)async {
        print("1: Start of Tablename : "+ tablename);

        prefs = await SharedPreferences.getInstance();

        Map<String , String> body = {
            'servicename': userData.servicename ,
            'query': userData.query ,
            'story': userData.story ,
            'sitecode': userData.sitecode ,
            'loginid': userData.loginid ,
            'password': userData.password ,
            'tzoffset': userData.tzoffset ,
            'deviceid': userData.deviceid ,
        };
        http.Response response = await http.post(
            Uri.encodeFull( GlobalVariable().getServerUrl() ) ,
            headers:
            {
                "Accept": "application/json" ,
                "Content-Type": "application/x-www-form-urlencoded"
            } ,
            body: body ,
        );

        print("Responce Body == : "+ response.body );

        Map decoded = json.decode( response.body );
        var row_data = decoded['row_data'];


        var columnName = decoded['columns'];
        //print("row_data == : "+row_data [0]);
        //print("columnName == :"+columnName);
        var splitrows= row_data[0];
        List row = row_data.split(splitrows);

        List colRecord = columnName.split( "@" );
        print("Column Record == : "+ colRecord.toString().replaceAll("[,", "(").replaceAll("]", ")"));


        JobneedArray.clear( );
        JobneedChildArray.clear( );
        jid=new StringBuffer();
        print(" Length of Row data : "+ row.length.toString());



        if(row.length != 0){
            for (int rowno = 1; rowno <row.length; rowno++) {
                print("Row no == : "+rowno.toString()+" : "+row[rowno]);

                String recordsplit = row[rowno];

                var splitrecord= recordsplit[0];

                print("Split record by == : "+splitrecord);


                var record = recordsplit.split( splitrecord );
                print('The values are:'+tablename);

                //print(record[2].runtimeType);


                test = new Map<String , dynamic>( );


                for(var colno=1; colno < colRecord.length; colno++){
                    test[colRecord[colno]] = record[colno];

                }


                /*String ColFinal = colRecord.toString().replaceAll("[,", "(").replaceAll("]", ")");
            String RowFinal = record.toString().replaceAll("[,", "(").replaceAll("]", ")");*/
                //await dbHelper.insert("AssetDetails", test);


                //CreateTable();
                //print("Format Sql== : " + "INSERT Into Clients $ColFinal"" VALUES ${RowFinal}");

                /*String finalSQL ="INSERT Into AssetDetails $ColFinal"
                " VALUES ${RowFinal.toString()}";

            final id = await dbHelper.insert1("AssetDetails", finalSQL );
            print('inserted row id: $id');*/

                if(tablename == 'Jobneed'){
                    test["isdeleted"] = false;
                    test["syncStatus"] = 0;
                    jid.write(test["jobneedid"] + ",");
                }
                switch(tablename){
                    case 'Jobneed':
                        print(" Insert tablename: " +tablename);

                        //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["jobneedid"]).set(test);
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["jobneedid"]).child("syncstatus").set("-1");
                        await dbHelper.insert(tablename, test);

                        break;
                    case 'jnd':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["jndid"]).set(test);
                        break;
                    case 'AssetDetails':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["assetid"]).set(test);
                        //await dbHelper.insert(tablename, test);

                        break;
                    case 'People':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["peopleid"]).set(test);
                    print("tablename" +tablename);
                        await dbHelper.insert(tablename, test);

                        break;
                    case 'peoplegroup':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["groupid"]).set(test);
                        await dbHelper.insert(tablename, test);

                        break;
                    case 'qsetbelonging':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["qsbid"]).set(test);
                        await dbHelper.insert(tablename, test);

                        break;
                    case 'question':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["questionid"]).set(test);
                        await dbHelper.insert(tablename, test);

                        break;
                    case 'questionset':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["questionsetid"]).set(test);
                        await dbHelper.insert(tablename, test);

                        break;
                    case 'ticket':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["jobneedid"]).set(test);
                        break;
                    case 'typeassist':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["taid"]).set(test);
                        await dbHelper.insert(tablename, test);

                        break;
                    case 'address':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["addressid"]).set(test);
                        break;
                    case 'siteslist':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["buid"]).set(test);
                        break;
                    case 'siteinfo':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["contractid"]).set(test);
                        break;
                    case 'template':
                    //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["questionsetid"]).set(test);
                        break;
                }

            }
        }else{
            print("Row length is 0");
        }




        /*print("==================Count" + dbHelper.queryRowCount());
        print(json.encode(test));
        print( JobneedArray );
        print("==================jid");
        //String result = utf8.decode(JobneedArray);
        if(tablename == 'jobneed'){
            //print(jid.toString().substring(0,(jid.toString().length-1)));

            ss=jid.toString().substring(0,(jid.toString().length-1));
            print("ss: "+ss);
            getjndmodifiedafter();
        }*/

        print("count ==: "+tablename);
        var count= await dbHelper.queryRowCount(tablename);
        print(count);

        print("2: End of Tablename : "+ tablename);

    }


   /* @override
    void initState ( ) {
        super.initState( );
        print( "getdata not called" );
        this.getgetassetdetails( );

        print( "getdata called" );
    }*/

    /*CreateTable() async {
        DatabaseHelper._privateConstructor();
        static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
        Database db = await instance.database;

       *//* final id = await dbHelper.insert("AssetDetails", test);
        print('inserted row id: $id');*//*
    }*/


    @override
    Widget build(BuildContext context) {
        if (JobneedList == null) {
            JobneedList = List<Jobneed_DAO>();
            //updateListView();
        }
        return Scaffold(
            appBar: MorphingAppBar(
                backgroundColor: Color(0xff404040),
                title: Text('Intelliwiz'),
                actions: <Widget>[
                    IconButton(
                        key: ValueKey('logout'),
                        icon: Icon(Icons.logout),
                        onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context){
                                    return Logout();

                        },);
                        }),

                ],
                bottom: TabBar(

                    controller: _tabController,
                    indicatorColor: Colors.white,
                    isScrollable: true,

                    tabs: [
                        Text("All Task", style: new TextStyle(fontSize: 15.0, color: Colors.white,),),
                        Text("Site Visit", style: new TextStyle(fontSize: 15.0, color: Colors.white,),),
                        Text("Attendance", style: new TextStyle(fontSize: 15.0, color: Colors.white,),),
                        Text("Incident Report", style: new TextStyle(fontSize: 15.0, color: Colors.white,),),
                        Text("Assets", style: new TextStyle(fontSize: 15.0, color: Colors.white,),),
                        Text("Panic", style: new TextStyle(fontSize: 15.0, color: Colors.white,),),

                    ]
                ),
            ),

            drawerScrimColor: Color(0xff404040),
            drawerEdgeDragWidth: 10.0,
            drawer: SafeArea(
                child: Drawer(
                    elevation: 50.0,
                    child: ListView(
                        children: [
                            Container(
                                color: Color(0xff404040),
                                child: DrawerHeader(
                                    child: Image.asset("assets/youtility_logo.png"),
                                ),
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height,
                                color: Color(0xff404040),
                                child: Column(
                                    children: [
                                        Card(
                                            color: Color(0xff514e4e),

                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0)),
                                            margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                                            shadowColor: Colors.white,
                                            child: ExpansionTile(


                                                backgroundColor: Color(0xff514e4e),

                                                childrenPadding: EdgeInsets.only(left: 30.0),
                                                title: Text(
                                                    'Facility',
                                                    style: TextStyle(
                                                        color: Color(0xff404040),
                                                    ),
                                                ),
                                                children: [
                                                    ListTile(
                                                        title: Text(
                                                            'Task',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                    ListTile(
                                                        title: Text(
                                                            'PPM',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                    ListTile(
                                                        title: Text(
                                                            'Asset',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                    ListTile(
                                                        title: Text(
                                                            'Ticket',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                        Card(
                                            color: Color(0xff514e4e),

                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0)),
                                            margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                                            shadowColor: Color(0xffBCBDC1),
                                            child: ExpansionTile(
                                                backgroundColor: Color(0xff514e4e),

                                                childrenPadding: EdgeInsets.only(left: 30.0),
                                                title: Text(
                                                    'Guard Tour',
                                                    style: TextStyle(
                                                        color: Color(0xff404040),
                                                    ),
                                                ),
                                                children: [
                                                    ListTile(
                                                        title: Text(
                                                            'Tour',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                    ListTile(
                                                        title: Text(
                                                            'Site Audit',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                    ListTile(
                                                        title: Text(
                                                            'Conveyance',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                        Card(
                                            color: Color(0xff514e4e),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(10.0)),
                                            margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                                            shadowColor: Color(0xffBCBDC1),
                                            child: ExpansionTile(

                                                backgroundColor: Color(0xff514e4e),
                                                childrenPadding: EdgeInsets.only(left: 30.0),
                                                title: Text(
                                                    'Attendance',
                                                    style: TextStyle(
                                                        color: Color(0xff404040),
                                                    ),
                                                ),
                                                children: [
                                                    ListTile(
                                                        title: Text(
                                                            'Self Attendance',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                    ListTile(
                                                        title: Text(
                                                            'Mark Attendance',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                    ListTile(
                                                        title: Text(
                                                            'Site Attendance',
                                                            style: TextStyle(
                                                                color: Color(0xff404040),
                                                            ),
                                                        ),
                                                    ),
                                                ],
                                            ),
                                        ),
                                    ],
                                ),
                            ),
                        ],
                    ),
                ),
            ),
            body:SizedBox.expand(
                child: Container(
                    color: Color(0xff404040),
                    child: FutureBuilder<List>(
                        future: dbHelper.getAllRecords("Jobneed"),
                        initialData: List(),
                        builder: (context, snapshot) {
                            return snapshot.hasData
                                ? ListView.builder(
                                itemCount: snapshot.data.length,
                                itemBuilder: (_, int position) {
                                    final item = snapshot.data[position];
                                    //get your item data here ...
                                    return Card(
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                        ),

                                        child: ListTile(
                                            tileColor: Color(0xff514e4e),
                                            leading: Icon(Icons.more_vert,
                                                color: Colors.yellow,
                                                size: 20,),
                                            trailing: Icon(Icons.arrow_forward_ios,
                                                color: Colors.white,
                                                size: 20,),

                                            title: Text(
                                                /*"Task Name: " +*/ snapshot.data[position].row[2],
                                                style: TextStyle(color: Colors.white.withOpacity(1.0)),
                                            ),
                                        ),
                                    );
                                },
                            )
                                : Center(
                                child: CircularProgressIndicator(),
                            );
                        },
                    ),
                ),
            ),
            /**/
        );
    }

    void updateListView() {

        print("updateListView called: -----");
            Future<List<Jobneed_DAO>> todoListFuture = dbHelper.getAllRecords("Jobneed");
            todoListFuture.then((todoList1) {
                setState(() {
                    this.JobneedList = todoList1;
                    this.count = todoList1.length;
                });
            });

        print("updateListView end::::"+ count.toString());
    }
}

class UserData {
    String servicename;
    String query;
    String story;
    //String biodata;
    String info;
    String sitecode;
    String loginid;
    String password;
    String tzoffset;
    String deviceid;

    //UserData({this.deviceid:"358188079376258",this.loginid="shraddham", this.password:"sps123", this.servicename:"Login", this.sitecode:"YTPLD.YTHO",this.story:"1"});

    Map toJson() => {"servicename":servicename, "query":query, "story":story, "info":info, "sitecode":sitecode, "loginid":loginid, "password":password, "tzoffset":tzoffset, "deviceid":deviceid};
}

