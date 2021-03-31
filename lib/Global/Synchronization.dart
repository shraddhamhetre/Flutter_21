import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intelliwiz21/Activities/Question_List.dart';
import 'package:intelliwiz21/Activities/Camera_Activity.dart';
import 'package:intelliwiz21/Activities/Task_List.dart';
import 'package:intelliwiz21/Models/Jobneed_DAO.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';
import '../Logout.dart';
import 'Common_Function.dart';
import 'Database.dart';
import 'GlobalVariable.dart';

UserData userData;
Map<String, dynamic> test;
List JobneedArray = [];
List JobneedChildArray = [];
List JobneedChildArray1 = [];
StringBuffer jid;
String ss;

SharedPreferences prefs;
List<CameraDescription> cameras;


class Sync extends StatefulWidget {
  @override
  Sync_State createState() => new Sync_State();
}

class Sync_State extends State<Sync> with SingleTickerProviderStateMixin {
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
    print("===ontapped called" + index.toString());
    setState(() {
      _selectedIndex = index;
    });
  }

  static const _tabCount = 6;
  TabController _tabController;

   getCameras()async{
       cameras = await availableCameras();

  }



  @override
  void initState() {
    super.initState();
    getCameras();
    _tabController = TabController(length: _tabCount, vsync: this);
    //getgetassetdetails();
    //getpeoplemodifiedafter();
    getjobneedmodifiedafter();
  }

  //SimData simData;

  getgetassetdetails() async {
    print("getgetassetdetails==================");
    var deviceID;
    //simData = await SimService.getSimData;
    //print("==========--------"+simData.deviceId);
    //deviceID= simData.deviceId;
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query = "select * from getassetdetails('1970-01-01 13:53:39'," +
        prefs.get('siteid') +
        ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    //else{
    getresponse(userdata, "AssetDetails");
    getjobneedmodifiedafter();
  }

  getjobneedmodifiedafter() async {
    print("getjobneedmodifiedafter==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query =
        "select * from getjobneedmodifiedafter('1970-01-01 00:00:00', " +
            prefs.get('peopleid') +
            ", " +
            prefs.get('siteid') +
            ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "Jobneed");
    //gettypeassistmodifiedafter();
    //getjndmodifiedafter();
    getquestionsmodifiedafter();
  }

  gettypeassistmodifiedafter() async {
    print("typeassist==================");
    prefs = await SharedPreferences.getInstance();
    /*'"+new DateTime.now().toString()+"'*/
    userData = new UserData();
    userData.servicename = "Select";
    userData.query =
        "select * from gettypeassistmodifiedafter('1970-01-01 09:44:17+00:00'," +
            prefs.get('clientid') +
            ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    ;
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "TypeAssist");
    getpeoplemodifiedafter();
  }

  getpeoplemodifiedafter() async {
    print("getpeoplemodifiedafter==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query =
        "select * from getpeoplemodifiedafter('2018-02-14 13:53:39', " +
            prefs.get('peopleid') +
            ", " +
            prefs.get('clientid') +
            ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "People");
    //getgroupsmodifiedafter();
  }

  getgroupsmodifiedafter() async {
    print("getgroupsmodifiedafter==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query =
        "select * from getgroupsmodifiedafter('2018-02-14 13:53:39', " +
            prefs.get('siteid') +
            ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "Group");
    getquestionsmodifiedafter();
  }

  getquestionsmodifiedafter() async {
    print("getquestionsmodifiedafter==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query =
        "select * from getquestionsmodifiedafter('1970-01-01 13:53:39', " +
            prefs.get('clientid') +
            ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "Question");
    getquestionsetmodifiedafter();
  }

  getquestionsetmodifiedafter() async {
    print("getquestionsetmodifiedafter==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query =
        "select * from getquestionsetmodifiedafter('1970-01-01 13:53:39', " +
            prefs.get('siteid') +
            "," +
            prefs.get('clientid') +
            ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "QuestionSet");
    getqsetbelongingmodifiedafter();
  }

  getqsetbelongingmodifiedafter() async {
    print("getqsetbelongingmodifiedafter==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query =
        "select * from getqsetbelongingmodifiedafter('1970-01-01 00:00:00', " +
            prefs.get('siteid') +
            "," +
            prefs.get('clientid') +
            ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "QsetBelonging");
    //getticketmodifiedafter();
  }

  getticketmodifiedafter() async {
    print("getticketmodifiedafter==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query =
        "select * from getticketmodifiedafter('1970-01-01 00:00:00', " +
            prefs.get('peopleid') +
            ", " +
            prefs.get('siteid') +
            ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "ticket");
    getassetaddress();
  }

  getjndmodifiedafter(ss) async {
    print("getjndmodifiedafter==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query =
        "select * from getjndmodifiedafter('1970-01-01 00:00:00','" +
            ss +
            "' )";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "JOBNeedDetails");
    //get_siteslist();
  }

  getpgbelonging() async {
    print("getpgbelonging==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query = "select * from getpgbelonging(1970-01-01 00:00:00," +
        prefs.get('peopleid') +
        "," +
        prefs.get('siteid') +
        ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "PeopleGroupBelonging");
    // get_siteslist();
  }

  get_people_template_list() async {
    print("get_people_template_list==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query = "select * from get_people_template_list(" +
        prefs.get('clientid') +
        "," +
        prefs.get('peopleid') +
        ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "Templates");
    //getjndmodifiedafter();
  }

  getassetaddress() async {
    print("get_address==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query = "select * from getassetaddress('1970-01-01 00:00:00'," +
        prefs.get('siteid') +
        ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "Address");
    get_siteslist();
  }

  get_siteslist() async {
    print("get_siteslist==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query = "select * from get_siteslist(" +
        prefs.get('clientid') +
        " , " +
        prefs.get('peopleid') +
        ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "Sites");
    get_siteinfo();
  }

  get_siteinfo() async {
    print("get_siteslist==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query = "select * from get_siteinfo(" +
        prefs.get('clientid') +
        " , " +
        prefs.get('peopleid') +
        ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "SitesInfo");
    //get_people_template_list1();
  }

  get_people_template_list1() async {
    print("get_people_template_list1==================");
    prefs = await SharedPreferences.getInstance();

    userData = new UserData();
    userData.servicename = "Select";
    userData.query = "select * from get_people_template_list1(" +
        prefs.get('clientid') +
        " , " +
        prefs.get('peopleid') +
        ")";
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.tzoffset = "330";
    userData.deviceid = prefs.get('deviceid');
    userData.story = "1";
    print(userData.toJson());
    print("========================");
    getresponse(userdata, "template");
    //getassetaddress();
  }

  getresponse(userdata, tablename) async {
    print("1: Start of Tablename : " + tablename);

    prefs = await SharedPreferences.getInstance();

    Map<String, String> body = {
      'servicename': userData.servicename,
      'query': userData.query,
      'story': userData.story,
      'sitecode': userData.sitecode,
      'loginid': userData.loginid,
      'password': userData.password,
      'tzoffset': userData.tzoffset,
      'deviceid': userData.deviceid,
    };
    http.Response response = await http.post(
      Uri.encodeFull(GlobalVariable().getServerUrl()),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: body,
    );

    print("Responce Body == : " + response.body);

    Map decoded = json.decode(response.body);
    var row_data = decoded['row_data'];

    var columnName = decoded['columns'];
    //print("row_data == : "+row_data [0]);
    //print("columnName == :"+columnName);
    var splitrows = row_data[0];
    List row = row_data.split(splitrows);

    List colRecord = columnName.split("@");
    print("Column Record == : " +
        colRecord.toString().replaceAll("[,", "(").replaceAll("]", ")"));

    JobneedArray.clear();
    JobneedChildArray.clear();
    jid = new StringBuffer();
    print(" Length of Row data : " + row.length.toString());

    if (row.length != 0) {
      for (int rowno = 1; rowno < row.length; rowno++) {
        print("Row no == : " + rowno.toString() + " : " + row[rowno]);

        String recordsplit = row[rowno];

        var splitrecord = recordsplit[0];

        print("Split record by == : " + splitrecord);

        var record = recordsplit.split(splitrecord);
        print('The values are:' + tablename);

        //print(record[2].runtimeType);

        test = new Map<String, dynamic>();

        for (var colno = 1; colno < colRecord.length; colno++) {
          test[colRecord[colno]] = record[colno];
        }

        if (tablename == 'Jobneed') {
          print("jobneedid:  ==" + test["jobneedid"]);
          test["isdeleted"] = false;
          test["syncStatus"] = 0;
          jid.write(test["jobneedid"] + ",");
        }
        switch (tablename) {
          case 'Jobneed':
            print(" Insert tablename: " + tablename);

            //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["jobneedid"]).set(test);
            //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["jobneedid"]).child("syncstatus").set("-1");
            await dbHelper.insert(tablename, test);

            break;
          case 'JOBNeedDetails':
            //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["jndid"]).set(test);
            await dbHelper.insert(tablename, test);


            break;
          case 'AssetDetails':
            //database.reference().child(prefs.get('deviceid')).child(tablename).child(test["assetid"]).set(test);
            //await dbHelper.insert(tablename, test);

            break;
          case 'People':
            print("tablename" + tablename);
            await dbHelper.insert(tablename, test);

            break;
          case 'peoplegroup':
            await dbHelper.insert(tablename, test);

            break;

          case 'Question':
            await dbHelper.insert(tablename, test);

            break;
          case 'QuestionSet':
            await dbHelper.insert(tablename, test);

            break;
          case 'QsetBelonging':
            await dbHelper.insert(tablename, test);

            break;
          case 'ticket':
            break;
          case 'typeassist':
            await dbHelper.insert(tablename, test);

            break;
          case 'address':
            break;
          case 'siteslist':
            break;
          case 'siteinfo':
            break;
          case 'template':
            break;
        }
      }
    } else {
      print("Row length is 0");
    }

    //print("==================Count" + dbHelper.queryRowCount());
    print(json.encode(test));
    //print( JobneedArray );
    print("1: jndid =" + tablename);
    //String result = utf8.decode(JobneedArray);
    if (tablename == 'Jobneed') {
      print("2: jndid =" + tablename);

      print(jid.toString().substring(0, (jid.toString().length - 1)));

      ss = jid.toString().substring(0, (jid.toString().length - 1));
      print("ss: " + ss);
      getjndmodifiedafter(ss);
    }
    var count = await dbHelper.queryRowCount(tablename);

    print("count ==: " + tablename + count.toString());

    print("2: End of Tablename : " + tablename);
    //updateListView();
  }

  checkJobStarted(String StartTime, String EndTime){
    String check =IsJobStarts(StartTime, EndTime);
    print("checkJobStarted called : ");
    switch (check) {
      case '0':
        return print("Start job");
        break;
      case '1':
        return Fluttertoast.showToast(msg: "Job has not started", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,);
        break;
      case '2':
        return Fluttertoast.showToast(msg: "Job has expired", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,);
        break;
    }

  }

  @override
  Widget build(BuildContext context) {
    if (JobneedList == null) {
      print(" 1: get jobneed list");
      JobneedList = List<Jobneed_DAO>();
      //updateListView();
      //getjobneedmodifiedafter();
    } else {
      //updateListView();

    }
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: MorphingAppBar(
          /*backgroundColor: Color(0xff404040),*/
          title: Text(
            'Intelliwiz',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
                key: ValueKey('logout'),
                icon: Icon(Icons.logout),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return Logout();
                    },
                  );
                }),
          ],
          bottom: TabBar(
              labelPadding: EdgeInsets.only(bottom: 15, left: 7.5, right: 7.5),
              controller: _tabController,
              indicatorColor: Colors.white,
              isScrollable: true,
              labelStyle: TextStyle(
                  fontSize: 13.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              tabs: [
                Text("All Task"),
                Text("Site Visit"),
                Text("Attendance"),
                Text("Incident Report"),
                Text("Assets"),
                Text("Panic"),
              ]),
        ),
        drawerScrimColor: Color(0xff33334E),
        drawerEdgeDragWidth: 10.0,
        drawer: SafeArea(
          child: Drawer(
            elevation: 50.0,
            child: ListView(
              children: [
                Container(
                  /*color: Color(0xff404040),*/
                  child: DrawerHeader(
                    child: Image.asset("assets/youtility_logo.png"),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Color(0xff1F1F2A),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Card(
                          elevation: 0,
                          /*color: Color(0xff514e4e),*/
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          shadowColor: Colors.white,
                          child: ExpansionTile(
                            /*backgroundColor: Color(0xff514e4e),*/
                            childrenPadding: EdgeInsets.only(left: 30.0),
                            title: Text(
                              'Facility',
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                            children: [
                              ListTile(
                                title: Text(
                                  'Task',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                  onTap: (){
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => task_List(),
                                          )
                                      );
                                  }
                              ),
                              ListTile(
                                title: Text(
                                  'PPM',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Asset',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Ticket',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 0,
                          /*color: Color(0xff514e4e),*/
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          shadowColor: Color(0xffBCBDC1),
                          child: ExpansionTile(
                            /*backgroundColor: Color(0xff514e4e),*/
                            childrenPadding: EdgeInsets.only(left: 30.0),
                            title: Text(
                              'Guard Tour',
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                            children: [
                              ListTile(
                                title: Text(
                                  'Tour',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Site Audit',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Conveyance',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Card(
                          elevation: 0,
                          /*color: Color(0xff514e4e),*/
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0)),
                          margin: EdgeInsets.fromLTRB(5, 5, 5, 2),
                          shadowColor: Color(0xffBCBDC1),
                          child: ExpansionTile(
                            /*backgroundColor: Color(0xff514e4e),*/
                            childrenPadding: EdgeInsets.only(left: 30.0),
                            title: Text(
                              'Attendance',
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                            children: [
                              ListTile(
                                title: Text(
                                  'Self Attendance',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                                onTap: (){
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) => CameraScreen(),
                                      )
                                  );
                                }
                              ),
                              ListTile(
                                title: Text(
                                  'Mark Attendance',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Site Attendance',
                                  style: TextStyle(
                                    color: Color(0xffffffff),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: SizedBox.expand(

          child: Container(

            /*color: Color(0xff404040),*/
            child: FutureBuilder<List>(
              future: updateListView(),
              initialData: List(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? ListView.builder(
                        itemCount: JobneedList.length,
                        itemBuilder: (_, int position) {
                          return Card(
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ListTile(
                              isThreeLine: true,
                              onTap: ()=>
                                  checkJobStarted(convert_Server_Datetime(this
                                  .JobneedList[position]
                                  .plandatetime.toString()), convert_Server_Datetime(this
                                  .JobneedList[position]
                                  .expirydatetime.toString())),
                              /*tileColor: Color(0xff514e4e),*/
                              leading: new IconButton(
                                  icon: new Icon(
                                    Icons.more_vert,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  /*highlightColor: Colors.pink,*/
                                  onPressed: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => get_QuestionsTask(myObject: this.JobneedList[position].jobneedid.toString())));
                                  } ),
                              trailing: Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.white,
                                size: 20,
                              ),
                              title: Text(
                                /*"Task Name: " +*/ this
                                    .JobneedList[position]
                                    .jobdesc
                                    .toString(),
                                style: TextStyle(
                                    color: Colors.white.withOpacity(1.0),
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                "Plan Date: " + convert_Server_Datetime(this
                                    .JobneedList[position]
                                    .plandatetime.toString()) +
                                    "\nEnd Date:  " +
                                    convert_Server_Datetime(this
                                        .JobneedList[position]
                                        .expirydatetime.toString()),
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontWeight: FontWeight.w100),
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
      ),
    );
  }

  Future updateListView() {
    //print("updateListView called: -----");
    Future<List<Jobneed_DAO>> todoListFuture = dbHelper.getTaskList("Jobneed");
    todoListFuture.then((JobneedList) {
      setState(() {
        this.JobneedList = JobneedList;
        this.count = JobneedList.length;
      });
    });

    //print("updateListView end::::"+ count.toString());
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
  Map toJson() => {
        "servicename": servicename,
        "query": query,
        "story": story,
        "info": info,
        "sitecode": sitecode,
        "loginid": loginid,
        "password": password,
        "tzoffset": tzoffset,
        "deviceid": deviceid
      };
}
