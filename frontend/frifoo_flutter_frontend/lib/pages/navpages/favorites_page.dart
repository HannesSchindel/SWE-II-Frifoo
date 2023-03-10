import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  _FavoritesPageState createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  List<bool> _isFavoriteList = List.generate(20, (index) => true);
  bool _showFilter = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: MAIN_CONTAINER_MARGIN, left: MAIN_CONTAINER_MARGIN, right: MAIN_CONTAINER_MARGIN),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            "FAVORITES",
            style: FONT_FIRST_HEADING.copyWith(fontSize: 24.0),
            textAlign: TextAlign.left,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All of your favorite recipes.",
                style: FONT_SECOND_HEADING.copyWith(fontSize: 19.0),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 1),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _showFilter = !_showFilter;
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.filter_list),
                    SizedBox(width: 5),
                    Text(
                      "Filter",
                      style: FONT_SECOND_HEADING.copyWith(fontSize: 16.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (_showFilter)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 7),
                Text(
                  "Werbung",
                  style: FONT_PARAGRAPH.copyWith(
                      fontSize: 16.0, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "Beim Kauf der Pro-Version wird diese Funktion freigeschaltet.",
                  style: FONT_PARAGRAPH.copyWith(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
              ],
            ),
          SizedBox(height: 5),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.only(
                top: 5.0), // Abstand der Bilder zum "Scroll-Beginn"
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              children: List.generate(
                20, // Anzahl der angezeigten Bilder
                (index) {
                  return Center(
                    child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ImageBox(
                          title: "Rezept",
                          width: 200,
                          height: 250,
                          isFavorite: true,
                          imageSource:
                              'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
                        ),
                    ),
                  );
                },
              ),
            ),
          )
        ]));
  }
}
