// import 'dart:html';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainFloatingButton.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/home_page.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/results_page.dart';
import 'package:frifoo_flutter_frontend/pages/navpages/search_page.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  _ResultsPageState createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  List<bool> _ResultsList = List.generate(20, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(MAIN_CONTAINER_MARGIN),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              MainFloatingButton(
                  icon: Icon(Icons.chevron_left),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SearchPage()));
                  }),
              Text("Search Results", style: FONT_LOGO_BLACK_HEADING),
            ],
          ),
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
                          title: "Recipe $index",
                          height: 200,
                          width: 150,
                          isFavorite: false,
                          imageSource:
                              'https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
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
    );
  }
}
