import 'dart:html';
import 'dart:async';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "FAVORITES",
                style: FONT_FIRST_HEADING.copyWith(fontSize: 24.0),
                textAlign: TextAlign.left,
              ),
              // Text(
              //   "Some of your favorite recipes.",
              //   style: FONT_FIRST_HEADING.copyWith(fontSize: 16.0),
              //   textAlign: TextAlign.left,
              // ),

              GestureDetector(
                onTap: () {
                  setState(() {
                    _showFilter = !_showFilter;
                  });
                },
                // InkWell(
                //   onTap: () {
                //     setState(() {
                //       _showFilter = !_showFilter;
                //     });
                // },
                child: Row(
                  children: [
                    Icon(Icons.filter_list),
                    SizedBox(width: 5),
                    Text(
                      "Filter",
                      style: FONT_FIRST_HEADING.copyWith(fontSize: 16.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          if (_showFilter)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Filtermöglichkeiten",
                  style: FONT_FIRST_HEADING.copyWith(fontSize: 16.0),
                  textAlign: TextAlign.left,
                ),
                Text(
                  "Filter 1",
                ),
                SizedBox(height: 10),
              ],
            ),
          Text(
            "Some of your favorite recipes.",
            style: FONT_FIRST_HEADING.copyWith(fontSize: 16.0),
            textAlign: TextAlign.left,
          ),
          SizedBox(height: 10),
          // Text(
          //   "FAVORITES",
          //   style: FONT_FIRST_HEADING.copyWith(fontSize: 24.0),
          //   textAlign: TextAlign.left,
          // ),
          // SizedBox(height: 5),
          // Text(
          //   "Some of your favorite recipes.",
          //   style: FONT_FIRST_HEADING.copyWith(fontSize: 16.0),
          //   textAlign: TextAlign.left,
          // ),
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(top: 40.0),
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
