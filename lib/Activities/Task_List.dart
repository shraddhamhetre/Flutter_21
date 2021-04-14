import 'dart:core';

import 'package:draggable_floating_button/draggable_floating_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intelliwiz21/Activities/Question_List.dart';
import 'package:intelliwiz21/Global/Common_Function.dart';
import 'package:intelliwiz21/Global/Database.dart';
import 'package:intelliwiz21/Models/Jobneed_DAO.dart';
import 'package:swipeable_page_route/swipeable_page_route.dart';

import 'Camera_Activity.dart';
import 'Scan_qr.dart';
final dbHelper = DatabaseHelper.instance;


class task_List extends StatefulWidget {
  @override
  _task_List createState() => _task_List();
}

class _task_List extends State<task_List> {
    List<Jobneed_DAO> JobneedList;
    int count = 0;

    checkJobStarted(String StartTime, String EndTime){
        String check =IsJobStarts(StartTime, EndTime);
        print("checkJobStarted called : ");
        switch ("0") {
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
    @override
    Widget build(BuildContext context) => new Scaffold(

        appBar: MorphingAppBar(
            /*backgroundColor: Color(0xff404040),*/
            title: Text(
                'Task',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
            centerTitle: true,),
        body: Stack(children: <Widget>[
            DraggableFloatingActionButton(
                data: 'dfab_demo',
                offset: new Offset(250, 350),
                backgroundColor: Colors.grey,
                child: new Icon(
                    Icons.check,
                    color: Colors.black87,
                ),
                onPressed: ()=> print("test"),
                appContext: context,),

            Container(

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
                                                    MaterialPageRoute(builder: (context) => get_QuestionsTask(id: this.JobneedList[position].jobneedid.toString(),type: "TASK")));
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

        ])

    );
}