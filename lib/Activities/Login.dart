import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
//import 'package:fluttertoast/fluttertoast.dart';
import 'package:intelliwiz21/Activities/Dashboard.dart';
import 'package:intelliwiz21/Global/Synchronization.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import '../Global/GlobalVariable.dart';

var passwordVisible = false;
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class Login extends StatelessWidget {
  const Login({
    Key key,
    @required this.onSubmit,
  }) : super(key: key);
  final VoidCallback onSubmit;
  static final TextEditingController _sitecode = new TextEditingController();
  static final TextEditingController _username = new TextEditingController();
  static final TextEditingController _userpassword =
      new TextEditingController();

  String get sitecode => _sitecode.text;
  String get username => _username.text;
  String get userpassword => _userpassword.text;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return new Future(() => false);
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            //margin: EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(10.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      new Column(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(right: 15.0, left: 15.0),
                            child: Image.asset(
                              "assets/youtility_logo.png",
                              height: 150.0,
                              width: 250.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 15.0, left: 15.0),
                            child: new Column(
                              children: <Widget>[
                                new TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: _sitecode,
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    hintText: 'Site Code',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter site code';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                new TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: _username,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    hintText: 'Username',
                                  ),
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter username';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                new TextFormField(
                                  textAlign: TextAlign.center,
                                  controller: _userpassword,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(20.0),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0)),
                                    hintText: 'Password',
                                  ),
                                  obscureText: true,
                                  validator: (value) {
                                    if (value.isEmpty) {
                                      return 'Please enter password';
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                RaisedButton(
                                  padding: EdgeInsets.all(10.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  onPressed: () {
                                    print("Login ");
                                    onSubmit();
                                  },
                                  /*color: Color(0xff111727),*/
                                  child: new Text(
                                    "LOGIN",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.0,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  Login _login;

  @override
  void initState() {
    print(
        "GlobalVariable().getServerUrl(): " + GlobalVariable().getServerUrl());
  } //SimData simData;

  HomePageState() {
    _login = new Login(onSubmit: () {
      onSubmit();
    });
  }

  password() {
    setState(() {
      passwordVisible = !passwordVisible;
    });
  }

  void onSubmit() {
    print(
        "GlobalVariable().getServerUrl(): " + GlobalVariable().getServerUrl());
    if (_formKey.currentState.validate()) {
      getData();
      //getTimezone();
    }
    //getData( );
  }

  getTimezone() {
    var now = new DateTime.now().millisecondsSinceEpoch.toString();
    print(now);
    var timezoneOffset = new DateTime.now().timeZoneOffset;
    print(timezoneOffset);
    //var moonLanding = DateTime.parse("2018-08-03 09:44:17+00:00").millisecondsSinceEpoch.toString();
    var moonLanding = DateTime.parse("2018-08-03 09:44:17+00:00");
    print(moonLanding);
    print(moonLanding.toLocal());
  }

  Future<String> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var deviceID;
    //simData = await SimService.getSimData;
    //print("==========--------"+simData.deviceId);
    deviceID = DateTime.now().millisecondsSinceEpoch.toString();
    await prefs.setString('deviceid', deviceID);
    var deviceid = (prefs.get('deviceid'));
    print(deviceid);

    await prefs.setString('Sitecode', _login.sitecode);
    var Sitecode = (prefs.get('Sitecode'));
    await prefs.setString('Username', _login.username);
    var Username = (prefs.get('Username'));
    await prefs.setString('Userpassword', _login.userpassword);
    var Userpassword = (prefs.get('Userpassword'));

    UserData userData = new UserData();
    userData.deviceid = deviceid;
    userData.sitecode = /*_login.sitecode"SPS.DDCORP"*/ Sitecode;
    userData.loginid = /*_login.username"SHRADDHA"*/ Username;
    userData.password = /*_login.userpassword"SHRADDHA"*/ Userpassword;
    userData.servicename = 'Login';
    userData.story = '1';
    print(userData.toJson());
    print("========================");

    /* if (userData.sitecode.trim().length==0) {
    return 'Please enter some text';
    _login._sitecode= "please enter some text";
    }*/

    //else{
    Map<String, String> body = {
      'deviceid': userData.deviceid,
      'loginid': userData.loginid,
      'password': userData.password,
      'servicename': userData.servicename,
      'sitecode': userData.sitecode,
      'story': userData.story,
    };

    print(
        "GlobalVariable().getServerUrl(): " + GlobalVariable().getServerUrl());

    http.Response response = await http.post(
      Uri.encodeFull(GlobalVariable().getServerUrl()),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: body,
    );
    print("response.body" + response.body);
    Map decoded = json.decode(response.body);

    String rc = decoded['auth'];
    // String status = decoded['status'];
    print("===========rc");
    print(rc);

    await prefs.setString('siteid', decoded['siteid'].toString());
    await prefs.setString('clientid', decoded['clientid'].toString());

    int peopleid = decoded['peopleid'];
    // String status = decoded['status'];
    print("===========peopleid");
    print(peopleid);
    //await prefs.setInt('peopleid',peopleid);
    await prefs.setString('peopleid', peopleid.toString());

    String emergencycontact = decoded['emergencycontact'];
    await prefs.setString('emergencycontact', emergencycontact.toString());

    String emergencyemail = decoded['emergencyemail'];
    await prefs.setString('emergencyemail', emergencyemail.toString());

    if (decoded['rc'] == 0 ||
        decoded['status'] == true ||
        decoded['auth'] == true) {
      print("Login Succesful");
      Navigator.of(context).push<void>(SwipeablePageRoute(
        builder: (_) => Sync(),
      ));
    } else {
      print(decoded['msg']);
      //Fluttertoast.showToast(msg: decoded['msg'], toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,);
    }

    //}
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: _login,
      ),
    );
  }
}

class UserData {
  String deviceid;
  String loginid;
  String password;
  String servicename;
  String sitecode;
  String story;

  //UserData({this.deviceid:"358188079376258",this.loginid="shraddham", this.password:"sps123", this.servicename:"Login", this.sitecode:"YTPLD.YTHO",this.story:"1"});
  Map toJson() => {
        "deviceid": deviceid,
        "loginid": loginid,
        "password": password,
        "servicename": servicename,
        "sitecode": sitecode,
        "story": story
      };
}
