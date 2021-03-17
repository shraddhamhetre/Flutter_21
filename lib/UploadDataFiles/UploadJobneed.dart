
import 'dart:convert';

import 'package:intelliwiz21/Global/GlobalVariable.dart';
import 'package:intelliwiz21/Global/UploadParameters.dart';
import 'package:intelliwiz21/Models/Jobneed_DAO.dart';
import 'package:intelliwiz21/Global/Database.dart';
import 'package:intelliwiz21/Models/Jobneeddetails_DAO.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;



List<UploadJobneedParameter>uploaddataList = [];
SharedPreferences prefs ;


Future UploadTourTask1(String jobneedid)async{
    prefs=await SharedPreferences.getInstance();

    final dbHelper = DatabaseHelper.instance;
    List<UploadJNDData> jndUploadList = [];
    var jndDetails= [];

    List<Jobneed_DAO> jobneedlist = await dbHelper.getJobneedListSync("Jobneed", jobneedid);
    List<Jobneeddetails_DAO> jobneeddetaillist = await dbHelper.getJNDList("JOBNeedDetails", jobneedid);

    print("Sync Jobneed count called:"+ jobneedlist.length.toString());
    print("Sync jobneeddetaillist count called:"+ jobneeddetaillist.length.toString());

    List getJnddetails(Jobneedid){

        for(int i=0; i <jobneeddetaillist.length; i++) {
            UploadJNDData jndData = new UploadJNDData(
                jobneeddetaillist[i].jobneedid.toString(),
                jobneeddetaillist[i].answer,
                jobneeddetaillist[i].jndid.toString(),
                jobneeddetaillist[i].questionid.toString(),
                jobneeddetaillist[i].type.toString(),
                jobneeddetaillist[i].jobneedid.toString(),
                jobneeddetaillist[i].seqno.toString(),

            );
            jndUploadList.add(jndData);
            jndDetails.add(jndData.toJson());
        }
        return jndDetails;

    }



    if(jobneedlist.length == 0 ){
        print(" All data is syncd");
    }else{
        for(int i=0; i <jobneedlist.length; i++){
            print("jobneedlist"+ jobneedlist[i].jobstatus.toString());
            UploadJobneedParameter updata = new UploadJobneedParameter(
                jobneedlist[i].aatop.toString(),
                jobneedlist[i].assetid.toString(),
                jobneedlist[i].buid.toString(),
                jobneedlist[i].cdtz,
                jobneedlist[i].ctzoffset.toString(),
                jobneedlist[i].cuser.toString(),
                jobneedlist[i].endtime,
                jobneedlist[i].expirydatetime,
                jobneedlist[i].frequency.toString(),
                jobneedlist[i].gpslocation,
                jobneedlist[i].gracetime.toString(),
                jobneedlist[i].groupid.toString(),
                jobneedlist[i].identifier.toString(),
                jobneedlist[i].jobdesc,
                jobneedlist[i].jobid.toString(),
                jobneedlist[i].jobneedid.toString(),
                jobneedlist[i].jobstatus.toString(),
                jobneedlist[i].jobtype.toString(),
                jobneedlist[i].mdtz,
                jobneedlist[i].multiplicationfactor,
                jobneedlist[i].muser.toString(),
                jobneedlist[i].parent.toString(),
                jobneedlist[i].peopleid.toString(),
                jobneedlist[i].performedby.toString(),
                jobneedlist[i].plandatetime,
                jobneedlist[i].priority.toString(),
                jobneedlist[i].questionsetid.toString(),
                jobneedlist[i].receivedonserver,
                jobneedlist[i].remarks,
                jobneedlist[i].ScanType.toString(),
                jobneedlist[i].starttime,
                jobneedlist[i].syncStatus,
                jobneedlist[i].ticketcategory.toString(),
                await getJnddetails(jobneedlist[i].jobneedid),
                "",
            );
            uploaddataList.add(updata);
        }

        for (var i = 0; i < uploaddataList.length; i++) {
            UploadParameter uploadParameter = new UploadParameter(
                "TaskAndTourUpdate",
                "",
                "1",
                uploaddataList[i].toJson().toString(),
                "",
                prefs.get('Sitecode'),
                prefs.get('Username'),
                prefs.get('Userpassword'),
                "330",
                prefs.get('deviceid')
            );


            print("@@@@@Uploadjobneed[i].toJson().toString(): " +
                uploaddataList[i].toJson().toString());


            print("@@@@body=" + uploadParameter.toJson().toString());
            http.Response response = await http.post(
                Uri.encodeFull(GlobalVariable().getServerUrl()),
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



    //UploadSelfAttendance();
}