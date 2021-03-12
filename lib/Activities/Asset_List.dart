import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intelliwiz21/Global/Database.dart';

class Asset_List extends StatefulWidget
{
    @override
    Asset_List1 createState() => new Asset_List1();

}

class Asset_List1 extends State<Asset_List> {
    final dbHelper = DatabaseHelper.instance;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('List Of Employees'),
            ),
            body: FutureBuilder<List>(
                future: dbHelper.getAllRecords("tabEmployee"),
                initialData: List(),
                builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (_, int position) {
                            final item = snapshot.data[position];
                            //get your item data here ...
                            return Card(
                                child: ListTile(
                                    title: Text(
                                        "Employee Name: " + snapshot.data[position].row[1]),
                                ),
                            );
                        },
                    )
                        : Center(
                        child: CircularProgressIndicator(),
                    );
                },
            ),
        );
    }
}
