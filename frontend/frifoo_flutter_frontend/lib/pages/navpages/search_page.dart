import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/IngredientsGridView.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainFloatingButton.dart';
import 'package:frifoo_flutter_frontend/databases/sqlite_helper.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/results_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  SqliteHelper ingredientsDb = new SqliteHelper();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
          left: MAIN_CONTAINER_MARGIN,
          right: MAIN_CONTAINER_MARGIN,
          top: MAIN_CONTAINER_MARGIN),
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Search", style: FONT_PAGE_HEADING),
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
              ],
            ),
            MainButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultsPage(database: ingredientsDb,)));
                },
                inputText: "Find Recipes"),
            Row(
              children: [
                Text("My Ingredients", style: FONT_FIRST_HEADING),
                GestureDetector(
                onTap: () async {await ingredientsDb.deleteAll('ingredients'); setState(() {});},
                child: Icon(Icons.delete),
              ),
              ],
            ),
            IngredientGridView(database: ingredientsDb, tableName: 'ingredients',)
          ],
        ),
        Positioned(
            child: Align(
          alignment: FractionalOffset.bottomRight,
          child:
              MainFloatingButton(icon: const Icon(Icons.add), onPressed: _addIngredient),
        )),
      ]),
    );
  }



  final TextEditingController _controller = TextEditingController();

  Future _addIngredient() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Add Ingridient'),
            // ignore: prefer_const_constructors
            content: TextFormField(
              controller:  _controller,
              autofocus: true,
              decoration: const InputDecoration(hintText: 'e.g. potato'),
            ),
            actions: [TextButton(onPressed: submit, child: const Text('Add'))],
          ));

  void submit() async { 
    String title = _controller.text;
    bool insertedItem = await ingredientsDb.insert(title, 'ingredients');
      if (insertedItem) {
      print('Added new Ingredient');
      _printListAsString();
      setState(() {});
    } else {
      print('Insertion failed');
    }
    Navigator.of(context).pop();
  }

  // TESTING
  Future<void> _printListAsString() async {
  List<Map<dynamic, dynamic>> list = await ingredientsDb.fetchAll('ingredients');
  String formattedList = list.toString().replaceAll(", ", "\n");
  print(formattedList);
}
}
