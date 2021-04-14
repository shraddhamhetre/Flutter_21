

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelliwiz21/Global/Synchronization.dart';
import 'package:intelliwiz21/Models/QuestionSet_DAO.dart';

import 'Camera_Activity.dart';
import 'Question_List.dart';
List<QuestionSet_DAO> QsetData = List<QuestionSet_DAO>();

class ShowIncidentDataPage extends StatefulWidget {
    @override
    _ShowIncidentDataPage createState() => _ShowIncidentDataPage();
}
class _ShowIncidentDataPage extends State<ShowIncidentDataPage> {

    List<QuestionSet_DAO> qsetList;




    void initState() {
        // TODO: implement initState
        super.initState();
        Future<List<QuestionSet_DAO>> todoListFuture1 = dbHelper.getqSetList(
            "QuestionSet");
        todoListFuture1.then((QsetList) {
            setState(() {
                this.qsetList = QsetList;
            });
        });
        //print("length"+  qsetList.length.toString());
    }

    getdata() {
        //print("qsetlength"+ qsetList.length.toString());
        QsetData.clear();

        for (var i = 0; i < qsetList.length; i++) {
            print("TYpe: " + qsetList[i].type.toString());
            if (qsetList[i].type == 43 && qsetList[i].parent == -1) {
                print("in 43");
                QuestionSet_DAO q = new QuestionSet_DAO(
                    qsetList[i].questionsetid,
                    qsetList[i].assetid,
                    qsetList[i].qsetname,
                    qsetList[i].seqno,
                    qsetList[i].enable,
                    qsetList[i].cuser,
                    qsetList[i].cdtz,
                    qsetList[i].muser,
                    qsetList[i].mdtz,
                    qsetList[i].type,
                    qsetList[i].parent,

                );

                QsetData.add(q);
                print("template count"+ QsetData.length.toString());
            }
        }
        //print("template List" +QsetData.length.toString());

    }

    Future<bool> _onWillPop() {
        return showDialog(
            context: context,
            builder: (context) =>
            new AlertDialog(
                title: new Text('Are you sure?'),
                content: new Text('Do you want to exit an App'),
                actions: <Widget>[
                    new FlatButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: new Text('No'),
                    ),
                    new FlatButton(
                        onPressed: () =>
                            Navigator.push(
                                context,
                                new MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        Sync())),
                        child: new Text('Yes'),
                    ),
                ],
            ),
        ) ?? false;
    }


    @override
    Widget build(BuildContext context) {
        return new FutureBuilder(
            future: getdata(),
            initialData: "Loading text..",
            builder: (BuildContext context, AsyncSnapshot<String> text) {
                return WillPopScope(child: Scaffold(
                    appBar: new AppBar(
                        title: new Text('Incident Report'),
                    ),
                    body: new Container(
                        child: Text("Incident Report"),
                        /*child: allData.length == 0
                            ? new Text(' No Data is Available')
                            : new ListView.builder(
                            itemCount: allData.length,
                            itemBuilder: (_, index) {
                                return Container(
                                    child: new Card(
                                        child: new GestureDetector(
                                            onTap: () =>
                                                Submit(allData[index].jobstatus,
                                                    index),
                                            child: new Column(
                                                crossAxisAlignment: CrossAxisAlignment
                                                    .start,
                                                mainAxisAlignment: MainAxisAlignment
                                                    .center,

                                                children: <Widget>[
                                                    new Row(children: <Widget>[

                                                        Get_Icon(allData[index]
                                                            .jobstatus),
                                                        new Padding(
                                                            padding: EdgeInsets
                                                                .all(10.0),
                                                            child: new Text(
                                                                allData[index]
                                                                    .jobdesc,
                                                                style: new TextStyle(
                                                                    fontSize: 18.0,
                                                                    color: Colors
                                                                        .black),),)
                                                    ],),

                                                    new Row(
                                                        children: <Widget>[
                                                            Text(getTimezone(
                                                                allData[index]
                                                                    .plandatetime),
                                                                style: new TextStyle(
                                                                    fontSize: 12.0,
                                                                    color: Colors
                                                                        .green),
                                                                textAlign: TextAlign
                                                                    .start,),
                                                            Text(getTimezone(
                                                                allData[index]
                                                                    .expirydatetime),
                                                                style: new TextStyle(
                                                                    fontSize: 12.0,
                                                                    color: Colors
                                                                        .red),
                                                                textAlign: TextAlign
                                                                    .end,),
                                                            //Text(JobneedArray[index]["expirydatetime"], style: new TextStyle(fontSize: 12.0, color: Colors.red), textAlign: TextAlign.end,),
                                                        ],
                                                    ),

                                                ],
                                            ),
                                        ),

                                    ),

                                );
                            },
                        )*/),
                    floatingActionButton: FloatingActionButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => popup())),
                        child: Icon(Icons.add),),
                ), onWillPop: _onWillPop);
            });
    }
}

class popup extends StatefulWidget {
    //final List text;

    popup({Key key, /*@required this.text*/}) : super(key: key);

    @override
    _popupState createState() => _popupState();
}

class _popupState extends State<popup> {
    List<QuestionSet_DAO> qsetList;

    void initState() {
        // TODO: implement initState
        super.initState();

    }

    String getqsetid(int qsetid){

        print("qsetlength"+ QsetData.length.toString() + " "+ qsetid.toString());

        for(var i=0; i<=QsetData.length; i++){
            print("qsetid"+ QsetData[i].parent.toString());
            if(qsetid == QsetData[i].parent){
                print("queset name"+ QsetData[i].qsetname);
                return QsetData[i].questionsetid.toString();
            }
        }
    }

    Widget setupAlertDialoadContainer() {
        return Container(
            height: 300.0, // Change as per your requirement
            width: 300.0, // Change as per your requirement
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: QsetData.length,
                itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(QsetData[index].qsetname),
                        onTap:()=>

                        {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => get_QuestionsTask(id:getqsetid(QsetData[index].questionsetid) ,   type: "ADHOC") ))
                        }
                    );
                },
            ),
        );
    }
    @override
    Widget build(BuildContext context) {
        return  AlertDialog(
            title: Text('Question Set'),
            content: setupAlertDialoadContainer(),
        );

    }
}







