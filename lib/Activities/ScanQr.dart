import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intelliwiz21/Global/Database.dart';
import 'package:intelliwiz21/Models/Jobneeddetails_DAO.dart';
import 'package:intelliwiz21/Models/QuestionSetBelong_DAO.dart';
import 'package:intelliwiz21/Models/QuestionSet_DAO.dart';
import 'package:intelliwiz21/Models/Question_DAO.dart';
import 'package:intelliwiz21/UploadDataFiles/UploadJobneed.dart';
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
    DateTime currentDate = DateTime.now();
    TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);



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

    }

    Future<void> _selectDate(BuildContext context, int index) async {
        final DateTime pickedDate = await showDatePicker(
            context: context,
            initialDate: currentDate,
            firstDate: DateTime(2015),
            lastDate: DateTime(2050));
        if (pickedDate != null && pickedDate != currentDate)
            setState(() {
                currentDate = pickedDate;
                JndList[index].answer= currentDate.toString();
                JndList[index].jndid= DateTime.now().millisecondsSinceEpoch;

            });
    }

    Future<void> _selectTime(BuildContext context, int index) async {
        final TimeOfDay pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(DateTime.now())) ;
            if (pickedTime != null && pickedTime != currentDate)
            setState(() {
                selectedTime = pickedTime;
                JndList[index].answer= selectedTime.toString();
                JndList[index].jndid= DateTime.now().millisecondsSinceEpoch;

            });
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

                        List<String> option= (QuestionList[i].option).split(",");
                        print("====option"+ option.toString());

                        String qname= QuestionList[i].questionname;
                        String type= QuestionList[i].type.toString();

                        print("=============type:"+type);
                        print("=============qname:"+qname+"====qid"+QuestionList[i].questionid.toString());
                        switch(type){
                            case "57":
                                //Yes/No type
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

                                                                    JndList[index].answer= rating.toString();
                                                                    JndList[index].cdtz= DateTime.now().millisecondsSinceEpoch.toString();
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
                                                        JndList[index].answer= email1.toString();
                                                        JndList[index].cdtz= DateTime.now().millisecondsSinceEpoch.toString();
                                                        print("rating=====:"+ email1.toString());
                                                    },),)

                                        ],
                                    );
                                }
                                break;
                            case "48":

                                //Checkbox type
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
                                            RaisedButton(
                                                onPressed: () => _selectDate(context, index),
                                                child:  Text(currentDate.toString())
                                            ),


                                        ],
                                    );
                                }

                                /*{
                                    return Column(crossAxisAlignment: CrossAxisAlignment.start ,
                                        mainAxisAlignment: MainAxisAlignment.center ,
                                        children: <Widget>[
                                            new Padding(padding: EdgeInsets.all( 5.0 ) ,
                                                child: new Text( qData[i].questionname,
                                                    style: new TextStyle(
                                                        fontSize: 15.0 , color: Colors.black ) , ) ,),
                                            DateTimePickerFormField(
                                                controller: _date,
                                                inputType: inputType1,
                                                format: formats[inputType1],
                                                editable: editable,
                                                decoration: InputDecoration(
                                                    labelText: 'date'),
                                                onChanged: (dt) => setState(
                                                        () {
                                                        this.dt = dt;
                                                        questAnsTransList[index].answer= dt.toString();
                                                        questAnsTransList[index].jndid= DateTime.now().millisecondsSinceEpoch.toString();
                                                        print("dt=====:"+ dt.toString());
                                                    },
                                                ),
                                            ),
                                        ],
                                    );
                                }*/

                                break;
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
                                                            JndList[index].answer= currentvalue.toString();
                                                            JndList[index].cdtz= DateTime.now().millisecondsSinceEpoch.toString();
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
                                            RaisedButton(
                                                onPressed: () => _selectTime(context, index),
                                                child:  Text(selectedTime.toString())
                                            ),
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
                                                        JndList[index].answer= singleline1.toString();
                                                        JndList[index].cdtz= DateTime.now().millisecondsSinceEpoch.toString();
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
                                                        JndList[index].answer= multiline1.toString();
                                                        JndList[index].cdtz= DateTime.now().millisecondsSinceEpoch.toString();
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
                                                        JndList[index].answer= numeric1.toString();
                                                        JndList[index].cdtz= DateTime.now().millisecondsSinceEpoch.toString();
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
    String jobneedid = widget.myObject;

    print("get numeric======" + numeric);
    print("get singleline======" + singleline);
    print("get multiline======" + multiline);
    print("get date1======" + date1);
    print("get time======" + time);
    print("get email======" + email);
    //print( "get dropdown===="     + currentvalue );
    print("get yes/no====" + _textResult);
    print("get rating====" + uRating.toString());
    print( "get jobneedid===="    + jobneedid);


    for (int indx = 0; indx <= JndList.length - 1; indx++) {
        print("========-------------------=========");
        print("ans:" + JndList[indx].answer);
        print("cdtz:" + JndList[indx].cdtz);
        print("cuser:" + JndList[indx].cuser.toString());
        print("mdtz:" + JndList[indx].mdtz);
        print("muser:" + JndList[indx].muser.toString());
        print("jndid:" + JndList[indx].jndid.toString());
        print("jobneedid:" + JndList[indx].jobneedid.toString());
        print("min:" + JndList[indx].min);
        print("max:" + JndList[indx].max);
        print("option:" + JndList[indx].option);
        print("questionid:" + JndList[indx].questionid.toString());
        print("type:" + JndList[indx].type.toString());

        dbHelper.UpdateJndTable("JOBNeedDetails", JndList[indx].answer, JndList[indx].cdtz, JndList[indx].jndid );


        Jobneeddetails_DAO questionAnsTransaction = new Jobneeddetails_DAO(
            JndList[indx].jndid,
            JndList[indx].jobneedid,
            JndList[indx].seqno,
            JndList[indx].questionid,
            JndList[indx].answer,
            JndList[indx].min,
            JndList[indx].max,
            JndList[indx].option,
            JndList[indx].alerton,
            JndList[indx].type,
            JndList[indx].cdtz,
            JndList[indx].mdtz,
            JndList[indx].cuser,
            JndList[indx].muser,
            JndList[indx].ismandatory
        );

        //database.reference().child(prefs.get('deviceid')).child('jnd').child(questAnsTransList[indx].jndid).set(questAnsTransList);

        //ref.child(prefs.get('deviceid')).child('jnd').child(questAnsTransList[indx].jndid).set(questionAnsTransaction);
        //await ref.child(prefs.get('deviceid')).child('jnd').child(questAnsTransList[indx].jndid).set(questionAnsTransaction.toJson());
    }

    await dbHelper.UpdateJobneedTable("Jobneed", "1", "30 ",DateTime.now().toString(), jobneedid);

    UploadTourTask1(jobneedid);

/*    JobneedAnsTransaction jobneedAnsTransaction = new JobneedAnsTransaction(
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
            new ShowDataPageTask()));*/
    }

}


