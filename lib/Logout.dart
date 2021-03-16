import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:path/path.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'Activities/Login.dart';
import 'Global/GlobalVariable.dart';

//import 'JobneedData.dart';
//List<UploadJobneedParameter>Uploadjobneed = [];
BuildContext mContext;

class Logout extends StatelessWidget {
  //SimData simData;

  Future onSubmit1() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    UserData userData = new UserData();
    userData.deviceid = prefs.get('deviceid');
    userData.sitecode = prefs.get('Sitecode');
    userData.loginid = prefs.get('Username');
    userData.password = prefs.get('Userpassword');
    userData.servicename = 'Logout';
    userData.story = '1';
    print(userData.toJson());
    print("========================");

    //else{
    Map<String, String> body = {
      'deviceid': userData.deviceid,
      'loginid': userData.loginid,
      'password': userData.password,
      'servicename': userData.servicename,
      'sitecode': userData.sitecode,
      'story': userData.story,
    };

    http.Response response = await http.post(
      Uri.encodeFull(GlobalVariable().getServerUrl()),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
      body: body,
    );
    print(response.body);
    Map decoded = json.decode(response.body);

    String rc = decoded['auth'];
    // String status = decoded['status'];
    print("===========");
    print(rc);

    //print(status);

    if (decoded['rc'] == 0 ||
        decoded['status'] == true ||
        decoded['auth'] == true) {
      print("===========go to login");
      Navigator.of(mContext).push<void>(MaterialPageRoute(
        builder: (_) => HomePage(),
      ));

      /* Navigator.pop(
                mContext ,
                MaterialPageRoute( builder: ( context ) => HomePage()) ,
            );*/
    }

    //}
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;
    {
      return AlertDialog(
        contentTextStyle: TextStyle(
          color: Color(0xffffffff),
        ),
        elevation: 0,
        backgroundColor: Color(0xff33334E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        title: new Text(
          "Logout",
          style: TextStyle(color: Color(0xffffffff)),
        ),
        content: new Text("Do you want to logout?"),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            color: Color(0xff1A1C2B),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            child: new Text("Yes"),
            onPressed:
                onSubmit1, /*() {
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) =>
                    new HomePage(),));
            },*/
          ),
          /* new FlatButton(
                        child: new Text("No"),
                        onPressed:  () {
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    new Home(),));
                        },
                    ),*/
        ],
      );
    }
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
