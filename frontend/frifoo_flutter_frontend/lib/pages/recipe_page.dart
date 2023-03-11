import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainFloatingButton.dart';
import 'package:frifoo_flutter_frontend/customWidgets/RecipeHeader.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

class RecipePage extends StatefulWidget {
  final Map<String, dynamic> recipeData;

  RecipePage({super.key, required this.recipeData});

  @override
  // ignore: library_private_types_in_public_api
  _RecipePageState createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {

  Future<String> getPreparationFromAPI() async {
    print(widget.recipeData['recipe']['uri']);
    http.Response response = await http.get(Uri.parse(widget.recipeData['recipe']['uri']));

    if (response.statusCode == 200) {
      Map<String, dynamic> data;
      data = jsonDecode(response.body);
      
      // print(data);
      return 'yeaaah';
    } else {
      throw Exception('Failed to load data from API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SingleChildScrollView(
              //margin: const EdgeInsets.all(MAIN_CONTAINER_MARGIN),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          RecipeHeader(imageurl: widget.recipeData['recipe']['image'], title: widget.recipeData['recipe']['label']),
                          Padding(
                            padding: EdgeInsets.only(left: 10, top: 40),
                            child: MainFloatingButton(
                              icon: const Icon(Icons.chevron_left),
                              onPressed: () {
                                Navigator.pop(context);
                              }
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(left: MAIN_CONTAINER_MARGIN, right: MAIN_CONTAINER_MARGIN, bottom: MAIN_CONTAINER_MARGIN),
                    child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextStyle(
                              style: FONT_FIRST_HEADING,
                              child: const Text("Ingredients"))
                        ],
                      ),
                      DataTable(
                        columns: <DataColumn>[
                          // DataColumn(
                          //   label: Text('Description', style: FONT_SECOND_HEADING,),
                          //   tooltip: 'Description',
                          // ),
                          DataColumn(
                            label: Text('Name', style: FONT_SECOND_HEADING,),
                            tooltip: 'Name',
                          ),
                          DataColumn(
                            label: Text('Quantity', style: FONT_SECOND_HEADING,),
                            tooltip: 'Quantity',
                          )
                        ],
                        rows: widget.recipeData['recipe']['ingredients'].map<DataRow>((ingredient) => DataRow(cells: [
                        // DataCell(Text(ingredient['text'].toString(), style: FONT_PARAGRAPH,)),
                          DataCell(Text(ingredient['food'].toString().toUpperCase(), style: FONT_PARAGRAPH)),
                          DataCell(Text(ingredient['quantity'].toString(), style: FONT_PARAGRAPH)),
                        ])).toList(),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          DefaultTextStyle(
                              style: FONT_FIRST_HEADING,
                              child: const Text("Preparation"))
                        ],
                      ),
                      DefaultTextStyle(
                          style: FONT_PARAGRAPH,
                          child: Text('BESCHREIBUNG HIER'),
                      ),
                    ],
                  ))
                ],
              ),
            )
    );
  }
}
