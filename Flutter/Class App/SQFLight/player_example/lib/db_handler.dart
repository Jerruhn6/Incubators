import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


class DBHandler{
  Database? _database;

  Future<Database?> get database async{

    if(_database !=null){
      return _database;
    }

    //file Create, finding path internal storage 
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path,'mydatabase.db');

    //open DataBase/file
    _database =await openDatabase(path,version: 1,onCreate: (db, version){
     return _database!.execute(
        '''
        CREATE TABLE DatabseTable(
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER
        )
        '''
      );
    });
    return _database!;
    // '/0/internalStorage/Android'
  }
  insertData(int id,String name, int age) async{
    Database? db =await database;
    Map<String,Object?>map = {

      'id': id,
      'name': name,
      'age': age,
    };
    db!.insert('DatabaseTable',map );
  }
  readData()async{
    Database? db =await database;
    final list= db?.query('DatabaseTable');
    return list;
  }
}