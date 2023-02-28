import 'dart:html';

import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/CircleHeader.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          CircleHeader(),
          Container(
            margin: const EdgeInsets.only(
                left: MAIN_CONTAINER_MARGIN,
                right: MAIN_CONTAINER_MARGIN,
                bottom: MAIN_CONTAINER_MARGIN),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Featured', style: FONT_FIRST_HEADING),
                Text('Check out these featured Recipes', style: FONT_PARAGRAPH),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 25),
                        height: 200,
                        width: 150,
                        child: Center(
                            child: ImageBox(
                          title: "Rezept $index",
                          height: 200,
                          width: 150,
                          isFavorite: false,
                          imageSource:
                              'https://images.pexels.com/photos/2641886/pexels-photo-2641886.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                        )),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
                left: MAIN_CONTAINER_MARGIN,
                right: MAIN_CONTAINER_MARGIN,
                bottom: MAIN_CONTAINER_MARGIN),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Favorites', style: FONT_FIRST_HEADING),
                Text('Some of your favorite Recipes', style: FONT_PARAGRAPH),
                Container(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 25),
                        height: 200,
                        width: 150,
                        child: Center(
                            child: ImageBox(
                          title: "Favorit $index",
                          height: 200,
                          width: 150,
                          isFavorite: true,
                          imageSource:
                              'https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                        )),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
