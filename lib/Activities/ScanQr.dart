import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intelliwiz21/Global/Database.dart';
import 'package:intelliwiz21/Models/Jobneeddetails_DAO.dart';
import 'package:intelliwiz21/Models/QuestionSetBelong_DAO.dart';
import 'package:intelliwiz21/Models/QuestionSet_DAO.dart';
import 'package:intelliwiz21/Models/Question_DAO.dart';
import 'package:intl/intl.dart';

import 'package:flutter_rating/flutter_rating.dart';

import 'package:shared_preferences/shared_preferences.dart';
//import 'package:sps_revised/sync.dart';
//import 'tour.dart';
final f = new DateFormat('yyyy-MM-dd hh:mm:ss');
class get_QuestionsTask extends StatefulWidget {


    String myObject;
    get_QuestionsTask({
        this.myObject

    });
    @override
    get_Questions_State createState() => new get_Questions_State();
}
String currentvalue= null;
bool editable = true;
String _textResult = '';
double uRating=0.0;
DateTime date;
final TextEditingController _date =  new TextEditingController();
final TextEditingController _numeric = new TextEditingController();
final TextEditingController _email = new TextEditingController();
final TextEditingController _time =  new TextEditingController();
final TextEditingController _multiline = new TextEditingController();
final TextEditingController _singleline = new TextEditingController();

String  get email => _email.text;
String  get multiline => _multiline.text;
String  get singleline => _singleline.text;
String  get date1=> _date.text;
String  get time => _time.text;
String  get numeric=> _numeric.text;

class get_Questions_State extends  State<get_QuestionsTask> {
    List<Question_DAO> QuestionList;
    List<QuestionSet_DAO> QsetList;
    List<QuestionSetBelong_DAO> QSetBelongList;

    List<Jobneeddetails_DAO> JndList = [];


    int count = 0;
    int count1 = 0;
    int count2 = 0;


    final dbHelper = DatabaseHelper.instance;
    int starCount = 5;
    int _radioValue = 0;
    DateTime dt;
    DateTime time1;

    double currentrating;

    Future<String> getQuestions() async {


        print("getQuestions : JndList: "+ JndList.length.toString());

        String jobneedid = widget.myObject;

        Future<List<Jobneeddetails_DAO>> todoListFuture3 = dbHelper.getJNDList(
            "JOBNeedDetails", jobneedid);
        todoListFuture3.then((JndList) {
            setState(() {
                this.JndList = JndList;
                this.count2 = JndList.length;
            });
        });

        print("getQuestions : JndList: "+ JndList.length.toString());

/*        questAnsTransList.clear();
                if(data[key]['questionsetid']== qsetid ) {
                    for(var i=0;i<QuestionList.length;i++)
                    {
                        if(QuestionList[i].questionid==data[key]['questionid'])
                        {
                            QuestionAnsTransaction questionAnsTransaction=new QuestionAnsTransaction(
                                "",
                                DateTime.now().millisecondsSinceEpoch.toString(),
                                prefs.get('peopleid').toString(),
                                DateTime.now().millisecondsSinceEpoch.toString(),
                                prefs.get('peopleid').toString(),
                                DateTime.now().millisecondsSinceEpoch.toString(),
                                prefs.get('JidtimeStamp'),
                                data[key]['min'],
                                data[key]['max'],
                                data[key]['option'],
                                data[key]['questionid'],
                                QuestionList[i].type,
                                "0",
                                QuestionList[i].questionname);
                            questAnsTransList.add(questionAnsTransaction);

                            print(questionAnsTransaction.answer);
                        }
                    }
                }*/

    }

    @override
    void initState() {
        super.initState();
        print("getQuestions not called");
        this.getQuestions( );
        updateListView();
        print("getQuestions called");
    }

    @override
    void changedradio(int value) {
        setState(() {
            _radioValue = value;

            switch (_radioValue) {
                case 0:
                    _textResult = 'Yes';
                    print(_textResult);
                    break;
                case 1:
                    _textResult = 'No';
                    print(_textResult);
                    break;
            }
        });
    }

    getQuestion(qid, index) {

        List<String> option;

        for (int i=0; i<=QuestionList.length - 1; i++) {

                    if(qid == QuestionList[i].questionid){

                        if (QuestionList[i].options == null){
                            print("====option is null");

                        }else{
                            List<String> option= (QuestionList[i].options).split(",");
                            print("====option"+ option.toString());

                        }

                        String qname= QuestionList[i].questionname;
                        String type= QuestionList[i].type.toString();

                        print("=============type:"+type);
                        print("=============qname:"+qname+"====qid"+QuestionList[i].questionid.toString());
                        switch(type){
                            case "57":
                                return Column(
                                    crossAxisAlignment: CrossAxisAlignment.start ,
                                    mainAxisAlignment: MainAxisAlignment.center ,
                                    children: <Widget>[
                                        new Padding(  padding: EdgeInsets.all( 5.0 ) ,
                                            child: new Text( QuestionList[i].questionname,
                                                style: new TextStyle(
                                                    fontSize: 15.0 , color: Colors.black ) , ) ,),
                                        Row(
                                            children: <Widget>[
                                                new Radio(
                                                    value: 0,
                                                    groupValue: _radioValue,
                                                    onChanged:  (value) => changedradio(value),
                                                ),
                                                new Text('Yes'),
                                                new Radio(
                                                    value: 1,
                                                    groupValue: _radioValue,
                                                    onChanged: (value) => changedradio(value),
                                                ),
                                                new Text('No'),
                                            ],
                                        )
                                    ],
                                );
                                break;
                            case "79":
                                {
                                    //int starCount = QuestionList[i].max as int ;
                                    return Column(crossAxisAlignment: CrossAxisAlignment.start ,
                                        mainAxisAlignment: MainAxisAlignment.center ,
                                        children: <Widget>[
                                            new Padding(  padding: EdgeInsets.all( 5.0 ) ,
                                                child: new Text( QuestionList[i].questionname,
                                                    style: new TextStyle(
                                                        fontSize: 15.0 , color: Colors.black ) , ) ,),
                                            Row(
                                                children: <Widget>[
                                                    new Padding(
                                                        padding: new EdgeInsets.only(
                                                            top: 10.0,
                                                            bottom: 10.0,
                                                        ),
                                                        child: new StarRating(
                                                            size: 20.0,
                                                            rating: uRating,
                                                            color: Colors.orange,
                                                            borderColor: Colors.grey,
                                                            starCount: starCount,
                                                            onRatingChanged: (rating) => setState(
                                                                    () {
                                                                    uRating = rating;
                                                                    //questAnsTransList[index].answer= rating.toString();
                                                                    //questAnsTransList[index].jndid= DateTime.now().millisecondsSinceEpoch.toString();
                                                                    print("rating=====:"+ rating.toString());
                                                                },
                                                            ),
                                                        ),
                                                    ),
                                                ],
                                            )
                                        ],
                                    );
                                }
                                break;
                            case "51":
                                {
                                    return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start ,
                                        mainAxisAlignment: MainAxisAlignment.center ,
                                        children: <Widget>[
                                            new Padding(  padding: EdgeInsets.all( 5.0 ) ,
                                                child: new Text( QuestionList[i].questionname,
                                                    style: new TextStyle(
                                                        fontSize: 15.0 , color: Colors.black ) , ) ,),
                                            new TextField(controller: _email,decoration: new InputDecoration(hintText: "Email Id"),keyboardType: TextInputType.emailAddress,
                                                onChanged: (email1) => setState(
                                                        () {
                                                        email1 = email;
                                                        //questAnsTransList[index].answer= email1.toString();
                                                        //questAnsTransList[index].jndid= DateTime.now().millisecondsSinceEpoch.toString();
                                                        print("rating=====:"+ email1.toString());
                                                    },),)

                                        ],
                                    );
                                }
                                break;
                            case "48":
                                {
                                    return Column(
                                        children: <Widget>[
                                            Text(QuestionList[i].questionname),
                                        ],
                                    );
                                }
                                break;
                            case "49":
                                {
                                    return Column(
                                        children: <Widget>[
                                            Text(QuestionList[i].questionname),
                                        ],
                                    );
                                }break;
                            case "50":
                                {
                                    return Column(
                                        children: <Widget>[
                                            Text(QuestionList[i].questionname),
                                            new Container(
                                                margin: const EdgeInsets.all(15.0),
                                                child:
                                                DropdownButton(
                                                    value: currentvalue,
                                                    isDense: true,
                                                    onChanged: (String value) {
                                                        setState(() {
                                                            currentvalue= value;
                                                            //questAnsTransList[index].answer= value.toString();
                                                            //questAnsTransList[index].jndid= DateTime.now().millisecondsSinceEpoch.toString();
                                                            print(currentvalue.toString());
                                                        });
                                                    },
                                                    items: option.map((String value) {
                                                        return DropdownMenuItem(
                                                            value: value,
                                                            child: Text(value),
                                                        );
                                                    }).toList(),
                                                ),
                                            )],
                                    );
                                }
                                break;
                            case "56":
                                {
                                    return Column(
                                        children: <Widget>[
                                            Text(QuestionList[i].questionname),
                                        ],
                                    );
                                }
                                break;
                            case "55":
                                {
                                    return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start ,
                                        mainAxisAlignment: MainAxisAlignment.center ,
                                        children: <Widget>[
                                            new Padding(  padding: EdgeInsets.all( 5.0 ) ,
                                                child: new Text( QuestionList[i].questionname,
                                                    style: new TextStyle(
                                                        fontSize: 15.0 , color: Colors.black ) , ) ,),
                                            new TextField(controller: _singleline, decoration: new InputDecoration(hintText: "Answer"),
                                                onChanged: (singleline1) => setState(
                                                        () {
                                                        singleline1 = singleline;
                                                        //questAnsTransList[index].answer= singleline1.toString();
                                                        //questAnsTransList[index].jndid= DateTime.now().millisecondsSinceEpoch.toString();
                                                        print("singleline=====:"+ singleline1.toString());
                                                    },),)

                                        ],
                                    );
                                }
                                break;
                            case "52":
                                {
                                    return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start ,
                                        mainAxisAlignment: MainAxisAlignment.center ,
                                        children: <Widget>[
                                            new Padding(  padding: EdgeInsets.all( 5.0 ) ,
                                                child: new Text( QuestionList[i].questionname,
                                                    style: new TextStyle(
                                                        fontSize: 15.0 , color: Colors.black ) , ) ,),
                                            new TextField(controller: _multiline, decoration: new InputDecoration(hintText: "Answer"),keyboardType: TextInputType.multiline,
                                                maxLines: null,
                                                onChanged: (multiline1) => setState(
                                                        () {
                                                        multiline1 = multiline;
                                                        //questAnsTransList[index].answer= multiline1.toString();
                                                        //questAnsTransList[index].jndid= DateTime.now().millisecondsSinceEpoch.toString();
                                                        print("multiline=====:"+ multiline1.toString());
                                                    },),)
                                        ],
                                    );
                                }
                                break;
                            case "53":
                                {
                                    return Column(
                                        crossAxisAlignment: CrossAxisAlignment.start ,
                                        mainAxisAlignment: MainAxisAlignment.center ,
                                        children: <Widget>[
                                            new Padding(  padding: EdgeInsets.all( 5.0 ) ,
                                                child: new Text( QuestionList[i].questionname,
                                                    style: new TextStyle(
                                                        fontSize: 15.0 , color: Colors.white ) , ) ,),
                                            new TextField( controller: _numeric, decoration: new InputDecoration(hintText: option.toString()), keyboardType: TextInputType.number,
                                                cursorColor: Colors.white,
                                                onChanged: (numeric1) => setState(
                                                        () {
                                                        numeric1 = numeric;
                                                        JndList[index].Answer= numeric1.toString();
                                                        JndList[index].jndid= DateTime.now().millisecondsSinceEpoch;
                                                        print("numeric=====:"+ numeric1.toString());
                                                    },),)
                                        ],
                                    );
                                }
                                break;
                        }
                        //return (qname + " " + type);
                    }
                }




    }


    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: Text("QUESTION"),),
            floatingActionButton: FloatingActionButton(
                onPressed: () =>  get_answer(context),
                child: Text("Submit", style: TextStyle(fontSize: 10.0),),
                backgroundColor: Colors.blue,
            ),
            body: SizedBox.expand(
                child: Container(
                    color: Color(0xff404040),
                    child: FutureBuilder<List>(
                        //future: updateListView(),
                        initialData: List(),
                        builder: (context, snapshot) {
                            return snapshot.hasData
                                ? ListView.builder(
                                itemCount: JndList.length,
                                itemBuilder: (_, int position) {
                                    return Container(
                                        child: new Card(
                                            child: GestureDetector(
                                                onTap: () => Null,
                                                child: new Column(
                                                    crossAxisAlignment: CrossAxisAlignment
                                                        .start,
                                                    mainAxisAlignment: MainAxisAlignment
                                                        .center,
                                                    children: <Widget>[
                                                        new Padding(
                                                            padding: EdgeInsets
                                                                .all(10.0),
                                                            child: getQuestion(
                                                                JndList[position]
                                                                    .questionid,
                                                                position),
                                                        ),
                                                    ],
                                                ),
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
        );
    }


    Future updateListView() {
        String jobneedid = widget.myObject;


        print("updateListView called: -----questionList");
        Future<List<Question_DAO>> todoListFuture =  dbHelper.getquestionList("Question");
        todoListFuture.then((QuestionList) {
            setState(() {
                this.QuestionList = QuestionList;
                this.count = QuestionList.length;
            });
        });
        Future<List<QuestionSet_DAO>> todoListFuture1 = dbHelper.getqSetList("QuestionSet");
        todoListFuture1.then((QsetList) {
            setState(() {
                this.QsetList = QsetList;
                this.count1 = QsetList.length;
            });
        });
        Future<List<QuestionSetBelong_DAO>> todoListFuture2 = dbHelper.getqSetbelongList("QsetBelonging");
        todoListFuture2.then((QSetBelongList) {
            setState(() {
                this.QSetBelongList = QSetBelongList;
                this.count2= QSetBelongList.length;
            });
        });


        print("updateListView end:::: question" + count2.toString());
        //print("updateListView end:::: QuestionSet"+ count1.toString());
        //print("updateListView end:::: QsetBelonging"+ count2.toString());


    }


Future<String> get_answer(context)async {
    print("get numeric======" + numeric);
    print("get singleline======" + singleline);
    print("get multiline======" + multiline);
    print("get date1======" + date1);
    print("get time======" + time);
    print("get email======" + email);
    //print( "get dropdown===="     + currentvalue );
    print("get yes/no====" + _textResult);
    print("get rating====" + uRating.toString());
    //print( "get jobneedid===="    + prefs.get('jobneedid'));


    for (int indx = 0; indx <= JndList.length - 1; indx++) {
        print("========-------------------=========");
        print("ans:" + JndList[indx].Answer);
        print("cdtz:" + JndList[indx].cdtz);
        print("cuser:" + JndList[indx].cuser.toString());
            print("mdtz:" + JndList[indx].mdtz);
            print("muser:" + JndList[indx].muser.toString());
            print("jndid:" + JndList[indx].jndid.toString());
            print("jobneedid:" + JndList[indx].jobneedid.toString());
            print("min:" + JndList[indx].Min);
            print("max:" + JndList[indx].Max);
            print("option:" + JndList[indx].option);
            print("questionid:" + JndList[indx].questionid.toString());
            print("type:" + JndList[indx].type.toString());
    }
}

/*        Jobneeddetails_DAO questionAnsTransaction = new Jobneeddetails_DAO(
            JndList[indx].Answer, JndList[indx].cdtz,
            JndList[indx].cuser, JndList[indx].mdtz,
            JndList[indx].muser, JndList[indx].jndid,
            JndList[indx].jobneedid, JndList[indx].min,
            JndList[indx].max, JndList[indx].option,
            JndList[indx].questionid, JndList[indx].type,
            "0", JndList[indx].questionname
        );

        //database.reference().child(prefs.get('deviceid')).child('jnd').child(questAnsTransList[indx].jndid).set(questAnsTransList);

        //ref.child(prefs.get('deviceid')).child('jnd').child(questAnsTransList[indx].jndid).set(questionAnsTransaction);
        await ref.child(prefs.get('deviceid')).child('jnd').child(questAnsTransList[indx].jndid).set(questionAnsTransaction.toJson());
    }

    JobneedAnsTransaction jobneedAnsTransaction = new JobneedAnsTransaction(
        "-1", prefs.get('assetid').toString(), "0", prefs.get('siteid'), f.format(new DateTime.now()),
        "330", prefs.get('peopleid').toString(), f.format(new DateTime.now()), f.format(new DateTime.now()),
        "-1", "", "0", "-1", "10", "Adhoc Task Checkpoint : " + prefs.get('assetcode'), "-1",
        prefs.get('JidtimeStamp'), "30", "32", f.format(new DateTime.now()),
        "1.000000", prefs.get('peopleid').toString(), "-1", prefs.get('peopleid').toString(),
        prefs.get('peopleid').toString(), f.format(new DateTime.now()), "39",
        prefs.get('qsetid'), f.format(new DateTime.now()), "Adhoc Remark", "71",
        "0", f.format(new DateTime.now()),"1", "74", "0","DDCORP"
    );


    ref.child(prefs.get('deviceid')).child('jobneed').child(prefs.get('JidtimeStamp')).set(jobneedAnsTransaction.toJson());


    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (BuildContext context) =>
            new ShowDataPageTask()));
}*/
}
