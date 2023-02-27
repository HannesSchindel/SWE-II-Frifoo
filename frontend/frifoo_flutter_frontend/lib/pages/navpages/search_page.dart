import 'dart:html';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainFloatingButton.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/home_page.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/results_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<bool> _IngredientsList = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(MAIN_CONTAINER_MARGIN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Search", style: FONT_LOGO_BLACK_HEADING),
          Row(
            children: [
              const Icon(
                Icons.tune,
                color: Colors.black,
                size: 24.0,
              ),
              Text("Filter", style: FONT_SECOND_HEADING),
            ],
          ),
          MainButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultsPage()));
              },
              inputText: "Find Recipes"),
          Text("My Ingredients", style: FONT_FIRST_HEADING),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.only(top: 50.0),
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              children: List.generate(
                20,
                (index) {
                  return Center(
                    child: Stack(
                      children: [
                        ImageBox(
                          title: "Ingredient $index",
                          height: 200,
                          width: 150,
                          isFavorite: false,
                          imageSource:
                              'https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Kartoffeln_Sorte_Nicola.jpg/220px-Kartoffeln_Sorte_Nicola.jpg',
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          Positioned(
              left: 500,
              child:
                  MainFloatingButton(icon: Icon(Icons.add), onPressed: () {})),
        ],
      ),
    );
  }
}
