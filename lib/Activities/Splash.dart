import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'Login.dart';

class Splash extends StatefulWidget {

    @override
    beforsplash createState ( ) => new beforsplash( );
}

class beforsplash extends State<Splash> {
    @override
    Widget build(BuildContext context) {
        return new SplashScreen(
            seconds: 5,
            navigateAfterSeconds:  new HomePage(),
            title: new Text('Youtility Technologies Pvt Ltd',
                style: new TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0
                ),),
            image: new Image.network('assets/youtility.png'),
            //image: new Image.network('https://flutter.io/images/catalog-widget-placeholder.png'),
            backgroundColor: Colors.white,
            styleTextUnderTheLoader: new TextStyle(),
            photoSize: 100.0,
            onClick: ()=>print("Flutter Egypt"),
            loaderColor: Colors.red,

        );
    }
}