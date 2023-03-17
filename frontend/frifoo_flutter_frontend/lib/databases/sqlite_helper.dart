import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String ingredientsTableName = 'ingredients';
const String shoppingListTableName = 'shoppinglist';
const String colId = 'id';
const String colTitle = 'title';
const String colImageUrl = 'imageurl';

class SqliteHelper{
  late Database _database;

  //  SqliteHelper() {
  //   databaseFactory.deleteDatabase('local_db.db');
  //  }

  open() async{
    _database = await openDatabase(
      'local_db.db',
      version: 2,
      onCreate: (Database db, int version) async{
        await db.execute('CREATE TABLE $ingredientsTableName ('
          '$colId INTEGER PRIMARY KEY AUTOINCREMENT, '
          '$colTitle TEXT NOT NULL, '
          '$colImageUrl TEXT NOT NULL'
        ');');
        await db.execute('CREATE TABLE $shoppingListTableName ('
          '$colId INTEGER PRIMARY KEY AUTOINCREMENT, '
          '$colTitle TEXT NOT NULL, '
          '$colImageUrl TEXT NOT NULL'
        ');');
      }
    );
  }

  // Insert a new row
  Future<bool> insert(String givenTitle, String tableName) async{
    String title = givenTitle;
    await open();
    Map<String, dynamic> data = await _getIngredient(title);
    String label = data['title'];
    String image = data['imageurl'];
    Map<String, dynamic> dataToInsert = {'title':label, 'imageurl':image};
    int rowId = await _database.insert(tableName, dataToInsert);
    return rowId>0;
  }

  // Get all items from table
  Future<List<Map>> fetchAll(String tableName) async{
    await open();
    List<Map> items = await _database.query(tableName);
    return items;
  }

  // Get all items from table by specific order
  Future<List<Map>> fetchAllOrderedByID(String tableName) async{
    await open();
    List<Map> items = await _database.query(tableName, orderBy: '$colId desc');
    return items;
  }

  // Get ine specific item from table
  Future<Map> fetchOne(int id, String tableName) async{
    open();
    List<Map> items = await _database.query(tableName, where: '$colId=?', whereArgs: [id]);
    return items.first;
  }

  // Update one specific item from table
  Future<bool> update(int id, Map<String, dynamic> dataToUpdate, String tableName) async{
    await open();
    int rowsUpdated = await _database.update(tableName, dataToUpdate, where: '$colId=?', whereArgs: [id]);
    return rowsUpdated>0;
  }

  // Delete one specific item from table
  Future<bool> delete(int id, String tableName) async{
    await open();
    int rowsDeleted= await _database.delete(tableName, where:'$colId=?', whereArgs: [id]);
    return rowsDeleted==1;
  }

  // Delete all items from table
  Future<bool> deleteAll(String tableName) async{
    await open();
    int rowsDeleted= await _database.delete(tableName);
    return rowsDeleted>0;
  }
  
  Future<Map<String, dynamic>> _getIngredient(String title) async {
    http.Response response = await http.get(Uri.parse('http://10.0.2.2:8000/frifoo-api/ingredient/$title/'));

    if (response.statusCode == 200) {
        Map<String, dynamic> data;
        data = jsonDecode(response.body);
        
        print(data);
        return data;
      } else {
        throw Exception('Failed to load data from API');
      }
    }

  Future<String> fetchTitles(String tableName) async {
    await open();
    List<Map<String, dynamic>> maps = await _database.query(tableName, columns: ['title']);
    List<String> titles = List.generate(maps.length, (index) {
      return maps[index]['title'];
    });
    return titles.join(",");
  }
  
}