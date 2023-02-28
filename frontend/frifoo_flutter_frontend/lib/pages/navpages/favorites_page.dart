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
  List<bool> _isFavoriteList = List.generate(20, (index) => false);
  bool _showFilter = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.only(top: 15.0, left: 16.0, right: 16.0),
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
                  "Beim Kauf der Pro-Version ist diese Funktion freigeschaltet.",
                  style: FONT_PARAGRAPH.copyWith(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 5),
              ],
            ),
          SizedBox(height: 5),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(
                top: 8.0), // Abstand zwischen Filter und dem Beginn der Bilder
            child: GridView.count(
              padding: EdgeInsets.only(
                  top: 5.0), // Abstand der Bilder zum "Scroll-Beginn"
              crossAxisCount: 2,
              childAspectRatio: 1.0,
              children: List.generate(
                20, // Anzahl der angezeigten Bilder
                (index) {
                  return Center(
                    child: Stack(
                      children: [
                        ImageBox(
                          //title: "Rezept",
                          width: 200,
                          height: 250,
                          //isFavourite: true,
                          imageSource:
                              'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 22.0, bottom: 20.0),
                                child: Text(
                                  "Rezept",
                                  style: FONT_FIRST_HEADING.copyWith(
                                      fontSize: 14.0),
                                  textAlign: TextAlign.left,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          top: 15,
                          right: 10,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isFavoriteList[index] =
                                    !_isFavoriteList[index];
                              });
                            },
                            child: Container(
                              child: Icon(
                                Icons.favorite,
                                // border:
                                //     Border.all(color: Colors.red, width: 2.0),
                                color: _isFavoriteList[index]
                                    ? Colors.transparent
                                    : Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ))
        ]));
  }
}

class FilterPopup extends StatefulWidget {
  @override
  _FilterPopupState createState() => _FilterPopupState();
}

class _FilterPopupState extends State<FilterPopup> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
