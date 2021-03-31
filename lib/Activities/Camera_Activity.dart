import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;

import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelliwiz21/Global/Database.dart';
import 'package:intelliwiz21/Global/GlobalVariable.dart';
import 'package:intelliwiz21/Global/Synchronization.dart';
import 'package:intelliwiz21/Global/UploadParameters.dart';
import 'package:intelliwiz21/UploadDataFiles/UploadPELOG.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'dart:io';
final dbHelper = DatabaseHelper.instance;


String Status;
class CameraScreen extends StatefulWidget {
    @override
    _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State {
    CameraController controller;
    List cameras;
    int selectedCameraIndex;
    String imgPath;

    void get_Status() async{
        SharedPreferences prefs = await SharedPreferences.getInstance();
        Status =  await prefs.getString('Astatus') ?? "IN";
    }

    @override
    void initState() {
        get_Status();
        super.initState();
        availableCameras().then((availableCameras) {
            cameras = availableCameras;

            if (cameras.length > 0) {
                setState(() {
                    selectedCameraIndex = 0;
                });
                _initCameraController(cameras[selectedCameraIndex]).then((void v) {});
            } else {
                print('No camera available');
            }
        }).catchError((err) {
            print('Error :${err.code}Error message : ${err.message}');
        });
    }

    Future _initCameraController(CameraDescription cameraDescription) async {
        if (controller != null) {
            await controller.dispose();
        }
        controller = CameraController(cameraDescription, ResolutionPreset.high);

        controller.addListener(() {
            if (mounted) {
                setState(() {});
            }

            if (controller.value.hasError) {
                print('Camera error ${controller.value.errorDescription}');
            }
        });

        try {
            await controller.initialize();
        } on CameraException catch (e) {
            _showCameraException(e);
        }
        if (mounted) {
            setState(() {});
        }
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                child: SafeArea(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                            Expanded(
                                flex: 1,
                                child: _cameraPreviewWidget(),
                            ),
                            Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    height: 120,
                                    width: double.infinity,
                                    padding: EdgeInsets.all(15),
                                    color: Colors.black,
                                    child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: <Widget>[
                                            _cameraToggleRowWidget(),
                                            _cameraControlWidget(context),
                                            Spacer()
                                        ],
                                    ),
                                ),
                            )
                        ],
                    ),
                ),
            ),
        );
    }

    /// Display Camera preview.
    Widget _cameraPreviewWidget() {
        if (controller == null || !controller.value.isInitialized) {
            return const Text(
                'Loading',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w900,
                ),
            );
        }

        return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: CameraPreview(controller),
        );
    }

    /// Display the control bar with buttons to take pictures
    Widget _cameraControlWidget(context)  {

        return Expanded(
            child: Align(
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                        FloatingActionButton.extended(
                            onPressed: () {
                                _onCapturePressed(context);
                            },
                            label: Text(Status),
                            backgroundColor: Colors.pink,
                        )
                    ],
                ),
            ),
        );
    }


    /// Display a row of toggle to select the camera (or a message if no camera is available).
    Widget _cameraToggleRowWidget() {
        if (cameras == null || cameras.isEmpty) {
            return Spacer();
        }
        CameraDescription selectedCamera = cameras[selectedCameraIndex];
        CameraLensDirection lensDirection = selectedCamera.lensDirection;

        return Expanded(
            child: Align(
                alignment: Alignment.centerLeft,
                child: FlatButton.icon(
                    onPressed: _onSwitchCamera,
                    icon: Icon(
                        _getCameraLensIcon(lensDirection),
                        color: Colors.white,
                        size: 24,
                    ),
                    label: Text(
                        '${lensDirection.toString().substring(lensDirection.toString().indexOf('.') + 1).toUpperCase()}',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        ),),
                ),
            ),
        );
    }

    IconData _getCameraLensIcon(CameraLensDirection direction) {
        switch (direction) {
            case CameraLensDirection.back:
                return CupertinoIcons.switch_camera;
            case CameraLensDirection.front:
                return CupertinoIcons.switch_camera_solid;
            case CameraLensDirection.external:
                return Icons.camera;
            default:
                return Icons.device_unknown;
        }
    }

    void _showCameraException(CameraException e) {
        String errorText = 'Error:${e.code}\nError message : ${e.description}';
        print(errorText);
    }

    void _onCapturePressed(context) async {
            SharedPreferences prefs = await SharedPreferences.getInstance();

            final path = join((await getTemporaryDirectory()).path, '${DateTime.now()}.png');
            XFile file = await controller.takePicture();
            //var image = await controller.takePicture();
            print(path);
            String pelogid;
            print("1: status"+ Status );
            if(Status == "IN"){
                await prefs.setString('Astatus', "OUT");
                pelogid= DateTime.now().millisecond.toString();

                PeopleEventLog peopleeventlog= new PeopleEventLog(pelogid, "-1.0", prefs.get('deviceid'), DateTime.now().toString(), "0.0, 0.0", "0",
                    "0.0", "-1", "", "false", prefs.get('peopleid'), "21", "18", prefs.get('peopleid'), "-1", prefs.get('siteid'), prefs.get('peopleid'),
                    prefs.get('peopleid'), DateTime.now().toString(), DateTime.now().toString(), "-1", "0.0", "0", "0", "0", "0.0", "330", "0","1");
                await dbHelper.insert("PeopleEventLog", peopleeventlog.toJson());


            }else{
                pelogid= DateTime.now().millisecond.toString();

                await prefs.setString('Astatus', "IN");
                PeopleEventLog peopleeventlog= new PeopleEventLog(pelogid, "-1.0", prefs.get('deviceid'), DateTime.now().toString(), "0.0, 0.0", "0",
                    "0.0", "-1", "", "false", prefs.get('peopleid'), "21", "19", prefs.get('peopleid'), "-1", prefs.get('siteid'), prefs.get('peopleid'),
                    prefs.get('peopleid'), DateTime.now().toString(), DateTime.now().toString(), "-1", "0.0", "0", "0", "0", "0.0", "330", "0","1");
                await dbHelper.insert("PeopleEventLog", peopleeventlog.toJson());

            }
            Upload(file);

            UploadPELOGData(pelogid);
            Fluttertoast.showToast(msg: "Self Attendance marked", toastLength: Toast.LENGTH_LONG, gravity: ToastGravity.CENTER,);

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => Sync()),
            );
    }

    Upload(XFile imageFile) async {

        print("1: Upload image called");
        var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
        var length = await imageFile.length();

        var uri = Uri.parse(GlobalVariable().getServerUrl());

        var request = new http.MultipartRequest("POST", uri);
        var multipartFile = new http.MultipartFile('file', stream, length,
            filename: basename(imageFile.path));
        //contentType: new MediaType('image', 'png'));

        request.files.add(multipartFile);
        var response = await request.send();
        print(response.statusCode);
        response.stream.transform(utf8.decoder).listen((value) {
            print(value);
        });
        print("1: Upload image End");

    }

    void _onSwitchCamera() {
        selectedCameraIndex = selectedCameraIndex < cameras.length - 1 ? selectedCameraIndex + 1 : 0;
        CameraDescription selectedCamera = cameras[selectedCameraIndex];
        _initCameraController(selectedCamera);
    }
}