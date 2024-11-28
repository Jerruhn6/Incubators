import 'package:flutter/material.dart';
import 'todo_advance.dart';
import "todoMod.dart";
import "package:path/path.dart";
import "package:sqflite/sqflite.dart";

dynamic database;
List<Map<String,dynamic>> todoData = [];
insertData(TodoModel obj)async{

  Database localDB = await database;

  await localDB.insert(
      "Todo",
      obj.ml(),
      conflictAlgorithm : ConflictAlgorithm.replace
  );

}

deleteData(int index)async{
  Database localDB = await database;

  localDB.delete(
    "Todo",
    where:"index=?",
    whereArgs:[index]
  );
}

updateData(int index,TodoModel obj)async{

  Database localDB = await database;

  localDB.update(
    "Todo",
    obj.ml(),
    where:"index=?",
    whereArgs:[index],
    conflictAlgorithm : ConflictAlgorithm.replace
  );

}
  Future<List<Map<String, dynamic>>> getData(int index)async{
  Database localDB = await database;

       todoData = await localDB.query("Todo");
      
      return todoData; 

}

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  database = openDatabase(
     join(await getDatabasesPath(),"todoDB.db"),
    version:1,
    onCreate:(db,version)async{
      await db.execute(
        '''
            create table Todo(
              title TEXT,
              description TEXT,
              date TEXT
            )
        '''
      );
    }
  );
  
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TodoAdvance(),
    );
  }
}

