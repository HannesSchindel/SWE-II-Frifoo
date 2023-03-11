import 'package:flutter/material.dart';
import '../../constants.dart';
import '../../customWidgets/ImageBox.dart';
import '../../customWidgets/MainFloatingButton.dart';

class ShoppingListPage extends StatefulWidget {
  const ShoppingListPage({super.key});

  @override
  State<ShoppingListPage> createState() => _ShoppingListPageState();
}

class _ShoppingListPageState extends State<ShoppingListPage> {
  List<bool> _ShoppingList = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            left: MAIN_CONTAINER_MARGIN,
            right: MAIN_CONTAINER_MARGIN,
            top: MAIN_CONTAINER_MARGIN),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Shopping List", style: FONT_PAGE_HEADING),
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
                                title: "Item $index",
                                height: 200,
                                width: 150,
                                isFavorite: false,
                                imageSource:
                                    'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e3/Oranges_-_whole-halved-segment.jpg/1280px-Oranges_-_whole-halved-segment.jpg',
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
              child: MainFloatingButton(
                  icon: const Icon(Icons.add),
                  onPressed: () {
                    opendialog();
                  }),
            )),
          ],
        ));
  }

  Future opendialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text('Add Ingridient'),
            // ignore: prefer_const_constructors
            content: TextField(
              autofocus: true,
              decoration: const InputDecoration(hintText: 'e.g. potato'),
            ),
            actions: [TextButton(onPressed: submit, child: const Text('Add'))],
          ));

  void submit() {
    Navigator.of(context).pop();
  }
}


// IconButton(
//                             icon: Image.asset(''),
//                             iconSize: 50,
//                             onPressed: () {},
//                           )