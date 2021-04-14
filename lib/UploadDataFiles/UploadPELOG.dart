
import 'dart:convert';

import 'package:intelliwiz21/Global/GlobalVariable.dart';
import 'package:intelliwiz21/Global/UploadParameters.dart';
import 'package:intelliwiz21/Models/Jobneed_DAO.dart';
import 'package:intelliwiz21/Global/Database.dart';
import 'package:intelliwiz21/Models/Jobneeddetails_DAO.dart';
import 'package:intelliwiz21/Models/Pelog_DAO.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

List<PeopleEventLogUp>uploaddataList = [];
SharedPreferences prefs ;


Future UploadPELOGData(String pelogid)async{
    print("1: Start UploadPELOGData");
    prefs=await SharedPreferences.getInstance();

    final dbHelper = DatabaseHelper.instance;
    List<PeopleEventLog_DAO> peolglist = await dbHelper.getPELOGListSync("PeopleEventLog", pelogid, "pelogid");

    print("Sync Jobneed count called:"+ peolglist.length.toString());

    if(peolglist.length == 0 ){
        print(" All data is syncd");
    }else{
        for(int i=0; i <peolglist.length; i++){
            print("peolglist"+ peolglist[i].pelogid.toString());
            PeopleEventLogUp updata = new PeopleEventLogUp(
                peolglist[i].pelogid.toString(),
                peolglist[i].accuracy,
                peolglist[i].deviceid.toString(),
                peolglist[i].datetime,
                peolglist[i].gpslocation,
                peolglist[i].photorecognitionthreshold.toString(),
                peolglist[i].photorecognitionscore,
                peolglist[i].photorecognitiontimestamp,
                peolglist[i].photorecognitionserviceresponse,
                peolglist[i].facerecognition,
                peolglist[i].peopleid.toString(),
                peolglist[i].peventtype,
                peolglist[i].punchstatus,
                peolglist[i].verifiedby.toString(),
                peolglist[i].gfid.toString(),
                peolglist[i].buid.toString(),
                peolglist[i].cuser.toString(),
                peolglist[i].muser.toString(),
                peolglist[i].cdtz,
                peolglist[i].mdtz,
                peolglist[i].transportmode.toString(),
                peolglist[i].expamt,
                peolglist[i].duration.toString(),
                peolglist[i].reference,
                peolglist[i].remarks,
                peolglist[i].distance.toString(),
                peolglist[i].ctzoffset.toString(),
                peolglist[i].otherlocation,
                peolglist[i].syncStatus.toString(),

            );
            uploaddataList.add(updata);

            String peopleeventlog = "INSERT INTO peopleeventlog(accuracy, datetime, gpslocation, facerecognition, peopleid, peventtype, punchstatus, verifiedby, buid, cuser, muser, cdtz, mdtz, gfid, deviceid, transportmode, expamt, duration, reference, remarks, distance,otherlocation)";
            String valueStr = "(" + peolglist[i].accuracy + "," + "'" +
                peolglist[i].datetime + "'" + ","
                + "'" + peolglist[i].gpslocation + "'" + ","
                + "'" + peolglist[i].facerecognition + "'" + ","
                + peolglist[i].peopleid.toString() + ","
                + peolglist[i].peventtype + ","
                + peolglist[i].punchstatus + ","
                + peolglist[i].verifiedby.toString() + ","
                + peolglist[i].buid.toString() + ","
                + peolglist[i].cuser.toString()  + ","
                + peolglist[i].muser.toString() + ","
                + "'" + peolglist[i].cdtz + "'" + ","
                + "'" + peolglist[i].mdtz + "'" + ","
                + peolglist[i].gfid.toString() + ","
                + peolglist[i].deviceid.toString() + ","
                + peolglist[i].transportmode.toString() + ","
                + peolglist[i].expamt + ","
                + peolglist[i].duration.toString() + ","
                + "'" + peolglist[i].reference + "'" + ","
                + "'" + peolglist[i].remarks + "'" + ","
                + peolglist[i].distance.toString() + ","
                + "'" + peolglist[i].otherlocation + "'" + ")";
            String pelogQuery = peopleeventlog + "VALUES" + valueStr + " " +
                "returning pelogid;";
            print(pelogQuery);
            UploadInfoParameter info = UploadInfoParameter(
                "false", "Self Attendance");

            UploadParameter uploadParameter = new UploadParameter(
                "Insert",
                pelogQuery,
                "1",
                "",
                info.toJson().toString(),
                prefs.get('Sitecode'),
                prefs.get('Username'),
                prefs.get('Userpassword'),
                "330",
                prefs.get('deviceid'));
            print("@@@@@Uploadjobneed[i].toJson().toString(): " +
                uploadParameter.toJson().toString());


            print("@@@@body=" + uploadParameter.toJson().toString());
            Uri url= GlobalVariable().getServerUrl() as Uri;

            http.Response response = await http.post(
                url,
                headers:
                {
                    "Accept": "application/json",
                    "Content-Type": "application/x-www-form-urlencoded"
                },
                body: json.decode(uploadParameter.toJson()
                    .toString()), //uploadParameter.toJson().toJson().toString()*/ ,
            );
            print("response.body=== " + response.body);
        }

    }

    print("2: End UploadPELOGData");


    //UploadSelfAttendance();
}