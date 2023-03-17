import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainFloatingButton.dart';
import 'package:frifoo_flutter_frontend/customWidgets/RecipeGridView.dart';
import 'package:frifoo_flutter_frontend/databases/sqlite_helper.dart';
import 'package:frifoo_flutter_frontend/pages/recipe_page.dart';

class ResultsPage extends StatefulWidget {
  final SqliteHelper database;
  ResultsPage({super.key, required this.database});

  @override
  // ignore: library_private_types_in_public_api
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        Container(
          margin: const EdgeInsets.only(left: MAIN_CONTAINER_MARGIN, right: MAIN_CONTAINER_MARGIN, top: MAIN_CONTAINER_MARGIN),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  MainFloatingButton(
                      icon: const Icon(Icons.chevron_left),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  const SizedBox(width: 20),
                  Text("Found Recipes", style: FONT_PAGE_HEADING,)
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Icon(
                    Icons.tune,
                    color: Colors.black,
                    size: 24.0,
                  ),
                  DefaultTextStyle(
                      style: FONT_SECOND_HEADING,
                      child: Text("Filter", style: FONT_SECOND_HEADING)),
                ],
              ),
              RecipeGridView(database: widget.database)
            ],
          ),
        ),
    );
  }
}
