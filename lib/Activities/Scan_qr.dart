import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intelliwiz21/Global/Database.dart';
import 'package:intelliwiz21/Models/Asset_DAO.dart';
import 'package:intelliwiz21/Models/QuestionSet_DAO.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Adhoc_Task.dart';
import 'Question_List.dart';


final dbHelper = DatabaseHelper.instance;


class Scan_qr extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _Scan_qr();
}


class _Scan_qr extends State<Scan_qr> {
    final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
    Barcode result;
    QRViewController controller;
    var count =0;
    final dbHelper = DatabaseHelper.instance;


    List<Asset_DAO>AssetList;


    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future<List<Asset_DAO>> todoListFuture = dbHelper.getAssetList("AssetDetails");
    todoListFuture.then((AssetList) {
        setState(() {
            this.AssetList = AssetList;
            this.count = AssetList.length;
        });
    });
  }
    // In order to get hot reload to work we need to pause the camera if the platform
    // is android, or resume the camera if the platform is iOS.
    @override
    void reassemble() {
        super.reassemble();
        if (Platform.isAndroid) {
            controller.pauseCamera();
        } else if (Platform.isIOS) {
            controller.resumeCamera();
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Column(
                children: <Widget>[
                    Expanded(
                        flex: 5,
                        child: QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                        ),
                    ),

                ],
            ),
        );
    }

    void _onQRViewCreated(QRViewController controller) async{
        this.controller = controller;
        controller.scannedDataStream.listen((scanData) {
            setState(() async {
                result = scanData;
                print("result: "+result.code);
                for(var i=0; i< AssetList.length; i++){
                    if(result.code == AssetList[i].assetcode){
                        print("Asset Matched" + AssetList[i].qsetids );
                        List qset = AssetList[i].qsetname.split("~");
                        List qsetid = AssetList[i].qsetids.split(" ");
                        SharedPreferences prefs = await SharedPreferences.getInstance();

                        String JidtimeStamp=DateTime.now().millisecondsSinceEpoch.toString();
                        //SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString('JidtimeStamp',JidtimeStamp);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => popup(text :qset)));
                        controller?.dispose();
                        break;
                    }else{
                        print("Asset not matched");
                    }
                }
            });
        });
        /*for(var i=0; i< AssetList.length; i++){
            if(result == AssetList[i].assetcode){
                print("Asset Matched");
            }else{
                print("Asset not matched");
            }
        }*/
    }

    /*Widget Show_qset(){
        (result != null)
            ? Text(
            'Barcode Type: ${describeEnum(result.format)}   Data: ${result.code}')
            : Text('Scan a code'),

    }*/

    @override
    void dispose() {
        controller?.dispose();
        super.dispose();
    }
}

class popup extends StatefulWidget {
    final List text;

    popup({Key key, @required this.text}) : super(key: key);

  @override
  _popupState createState() => _popupState();
}

class _popupState extends State<popup> {
    List<QuestionSet_DAO> qsetList;

    void initState() {
        // TODO: implement initState
        super.initState();
        Future<List<QuestionSet_DAO>> todoListFuture1 = dbHelper.getqSetList("QuestionSet");
        todoListFuture1.then((QsetList) {
            setState(() {
                this. qsetList= QsetList;
            });
        });

    }


    String getqsetid(String name){

        print("qsetlength"+ qsetList.length.toString());

        for(var i=0; i<qsetList.length; i++){
            if(name == qsetList[i].qsetname){
                return qsetList[i].questionsetid.toString();
            }
        }
    }

    Widget setupAlertDialoadContainer(List qset) {
        return Container(
            height: 300.0, // Change as per your requirement
            width: 300.0, // Change as per your requirement
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: qset.length,
                itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        title: Text(qset[index]),
                        onTap:()/*=>Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Adhoc_Task(id: getqsetid(qset[index])))),*/

                        {
                        Navigator.push(context,
                        MaterialPageRoute(builder: (context) => get_QuestionsTask(id: getqsetid(qset[index]),type: "ADHOC") ));
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
            content: setupAlertDialoadContainer(widget.text),
        );

    }
}




