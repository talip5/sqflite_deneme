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

  createDatabase5() async{
    int fileCount=0;
    Directory? databaseDir = await getExternalStorageDirectory();
    String pathDir=databaseDir!.path;
    List contents = databaseDir.listSync();
    String databaseName='my_db55.db';
    File file=new File('$pathDir/$databaseName');
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        if(fileOrDir.path==file.path){
          fileCount++;
          print('Dosya mevcut');
        }
      }
    }
    if(fileCount==0){
      var path=join(pathDir,databaseName);
      var db55=await openDatabase(path);
      print('$db55 file created.');
    }
  }

  deleteDatabase5() async{
    Directory? databaseDir = await getExternalStorageDirectory();
    String pathDir=databaseDir!.path;
    String path=join(pathDir,'my_db55.db');
    await deleteDatabase(path);
    String databaseFile=path.split('/').last;
    print('$path deleted.');
    print('$databaseFile deleted.' );
  }

  listDatabase5() async{
    Directory? tempDir1 = await getExternalStorageDirectory();
    String pathDir1=tempDir1!.path;
    var path1=join(pathDir1,'my_db55.db');
    File file=new File('$pathDir1/my_db55.db');
    print(file);
    print(file.path);
    Directory? databaseDir = await getExternalStorageDirectory();
    String pathDir=databaseDir!.path;
    //print(pathDir);
    //print(pathDir.length);
    List contents = databaseDir.listSync();
    for (var fileOrDir in contents) {
      if (fileOrDir is File) {
        if(fileOrDir.path==file.path){
          print('Dosya mevcut');
        }
        print(fileOrDir);
      } else if (fileOrDir is Directory) {
        print(fileOrDir.path);
      }
    }
    print(contents.length);

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //listDatabase5();
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
                    createDatabase5();
                  },
                  child: Text('Create Database')
              ),
              ElevatedButton(
                  onPressed:(){
                    deleteDatabase5();
                  },
                  child: Text('Delete Database')
              ),
              ElevatedButton(
                  onPressed:(){
                    listDatabase5();
                  },
                  child: Text('List Database')
              ),
            ],
          ),
        ),
      ),
    );
  }
}
