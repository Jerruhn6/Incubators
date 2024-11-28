import 'package:flutter/material.dart';
import 'package:path/pathe.dart';
import 'package:sqflite/sqflite.dart';

dynamic database;

void insertPlayerData(Player pObj)async{
  Database localDB = await database;

  int id = await localDB.insert(
    'player',
    pObj.playerMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
  print("Id:$id");
}


void main(){
  WidgetsFlutterBinding.ensureInitialized();

  //Create DatatBase + table Create
  database = openDatabase(
    join(getDatabasesPath(), "IndiaPlayerDB.db"),
    version:1,
  )
}