import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/IngredientBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/RecipeBox.dart';
import 'package:frifoo_flutter_frontend/databases/sqlite_helper.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipeGridView extends StatefulWidget {
  final SqliteHelper database;

  RecipeGridView({required this.database});

  @override
  _RecipeGridView createState() => _RecipeGridView();
}

class _RecipeGridView extends State<RecipeGridView> {
  int _currentId = 0;

  Future<String> getRecipesFromDatabase() async {
    String recipesAsString;
    recipesAsString = await widget.database.fetchTitles();
    return recipesAsString;
  }

  Future<Map<String, dynamic>> getDataFromAPI() async {
    String recipesAsString = await getRecipesFromDatabase();

    http.Response response = await http.get(Uri.parse('http://10.0.2.2:8000/frifoo-api/recipes/$recipesAsString/'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data;
      data = jsonDecode(response.body);
      
      // print(data);
      return data;
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getDataFromAPI(),
      builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.hasData) {
          final List<dynamic> recipes = snapshot.data!['hits'];
          return Container(
            child: Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.9,
                children: List.generate(
                  recipes.length,
                  (index) {
                    return Center(
                      child: RecipeBox(
                        height: 175,
                        width: 150,
                        recipeData: recipes.elementAt(index),
                      )
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
