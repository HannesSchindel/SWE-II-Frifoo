import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/databases/sqlite_helper.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/results_page.dart';
import '../../constants.dart';
import '../../customWidgets/ImageBox.dart';
import '../../customWidgets/IngredientsGridView.dart';
import '../../customWidgets/MainButton.dart';
import '../../customWidgets/MainFloatingButton.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shopping List", style: FONT_PAGE_HEADING),
              ]
            ),
            Row(
              children: [
                Text("My Shopping List", style: FONT_FIRST_HEADING),
                GestureDetector(
                onTap: () async {await ingredientsDb.deleteAll('shoppinglist'); setState(() {});},
                child: Icon(Icons.delete),
              ),
              ],
            ),
            IngredientGridView(database: ingredientsDb, tableName: 'shoppinglist',)
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
            title: Text('Add Item'),
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
    bool insertedItem = await ingredientsDb.insert(title, 'shoppinglist');
      if (insertedItem) {
      print('Added new Ingredient');
      setState(() {});
    } else {
      print('Insertion failed');
    }
    Navigator.of(context).pop();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Container(
  //       margin: const EdgeInsets.only(
  //           left: MAIN_CONTAINER_MARGIN,
  //           right: MAIN_CONTAINER_MARGIN,
  //           top: MAIN_CONTAINER_MARGIN),
  //       child: Stack(
  //         children: [
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text("Shopping List", style: FONT_PAGE_HEADING),
  //               Expanded(
  //                 child: GridView.count(
  //                   padding: EdgeInsets.only(top: 50.0),
  //                   crossAxisCount: 2,
  //                   childAspectRatio: 1.0,
  //                   children: List.generate(
  //                     20,
  //                     (index) {
  //                       return Center(
  //                         child: Stack(
  //                           children: [
  //                             ImageBox(
  //                               title: "Item $index",
  //                               height: 200,
  //                               width: 150,
  //                               isFavorite: false,
  //                               imageSource:
  //                                   'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Oranges_-_whole-halved-segment.jpg/1280px-Oranges_-_whole-halved-segment.jpg',
  //                             )
  //                           ],
  //                         ),
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           Positioned(
  //               child: Align(
  //             alignment: FractionalOffset.bottomRight,
  //             child: MainFloatingButton(
  //                 icon: const Icon(Icons.add),
  //                 onPressed: () {
  //                   opendialog();
  //                 }),
  //           )),
  //         ],
  //       ));
  // }

  // Future opendialog() => showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //           title: Text('Add Ingridient'),
  //           // ignore: prefer_const_constructors
  //           content: TextField(
  //             autofocus: true,
  //             decoration: const InputDecoration(hintText: 'e.g. potato'),
  //           ),
  //           actions: [TextButton(onPressed: submit, child: const Text('Add'))],
  //         ));

  // void submit() {
  //   Navigator.of(context).pop();
  // }
}