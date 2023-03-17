import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/IngredientBox.dart';
import 'package:frifoo_flutter_frontend/databases/sqlite_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class IngredientGridView extends StatefulWidget {
  final SqliteHelper database;
  final String tableName;

  IngredientGridView({required this.database, required this.tableName});

  @override
  _IngredientGridViewState createState() => _IngredientGridViewState();
}

class _IngredientGridViewState extends State<IngredientGridView> {
  int _currentId = 0;

  Future<List<Map<dynamic, dynamic>>> getDataFromDatabase() async {
    List<Map<dynamic, dynamic>> data;
    data = await widget.database.fetchAll(widget.tableName);
    return data;
  }

  void delete() async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<dynamic, dynamic>>>(
      future: getDataFromDatabase(),
      builder: (BuildContext context, AsyncSnapshot<List<Map<dynamic, dynamic>>> snapshot) {
        if (snapshot.hasData) {
          return Container(
            child: Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1.0,
                children: List.generate(
                  snapshot.data!.length,
                  (index) {
                    return Center(
                      child: IngredientBox(
                        title: snapshot.data!.elementAt(index)['title'],
                        height: 200, 
                        width: 150,
                        imageSource: snapshot.data!.elementAt(index)['imageurl'],
                        database: widget.database,
                        tableName: widget.tableName,
                        id: snapshot.data!.elementAt(index)['id'],
                        onDelete: delete,
                        ),
                    );
                  }
                ),
              ),
            )
          );
        } else if (snapshot.hasError) {
          return Center(child: Text("${snapshot.error}"));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }

}
