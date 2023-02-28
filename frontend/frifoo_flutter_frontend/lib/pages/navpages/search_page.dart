import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainFloatingButton.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/results_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: MAIN_CONTAINER_MARGIN,
          right: MAIN_CONTAINER_MARGIN,
          top: MAIN_CONTAINER_MARGIN),
      child: Stack(children: [
        Column(
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
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ResultsPage()));
                },
                inputText: "Find Recipes"),
            Text("My Ingredients", style: FONT_FIRST_HEADING),
            Expanded(
              child: GridView.count(
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
          ],
        ),
        Positioned(
            child: Align(
          alignment: FractionalOffset.bottomRight,
          child:
              MainFloatingButton(icon: const Icon(Icons.add), onPressed: () {}),
        )),
      ]),
    );
  }
}
