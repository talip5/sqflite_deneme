import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  path_provider5() async{

    Directory? tempDir = await getExternalStorageDirectory();
    String pathDir=tempDir!.path;
    print(tempDir);
    print(pathDir);
  }

  database5() async{
    Directory? tempDir = await getExternalStorageDirectory();
    String pathDir=tempDir!.path;
    var path=join(pathDir,'my_db5.db');
    var db5=await openDatabase(path);
    //var db1 = await openDatabase('my_db1.db');
    //var db5 = await openDatabase('my_db.db');

    print(db5);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'sqfLite',
      home: Scaffold(
        appBar: AppBar(
          title: Text('SQFLITE'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('sqflite'),
              ElevatedButton(
                  onPressed:(){
                    database5();
                   // path_provider5();
                  },
                  child: Text('Database')),
            ],
          ),
        ),
      ),
    );
  }
}
