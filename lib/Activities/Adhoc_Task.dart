import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelliwiz21/Global/Database.dart';

class Adhoc_Task extends StatefulWidget
{

    String id;
    Adhoc_Task({this.id});


    @override
    _Adhoc_Task createState() => new _Adhoc_Task();

}

class _Adhoc_Task extends State<Adhoc_Task> {
    final dbHelper = DatabaseHelper.instance;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Question'),
            ),
            body: Text(widget.id)
        );
    }
}
