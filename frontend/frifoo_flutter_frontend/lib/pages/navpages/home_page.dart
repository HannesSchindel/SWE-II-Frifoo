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
              margin: const EdgeInsets.all(MAIN_CONTAINER_MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Featured', style: FONT_FIRST_HEADING),
                  Text('Hallo Hallo Wie Geht es dir?', style: FONT_PARAGRAPH),
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
                              height: 200,
                              width: 150,
                              imageSource: 'https://images.pexels.com/photos/2664443/pexels-photo-2664443.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',)
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(MAIN_CONTAINER_MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Favorites', style: FONT_FIRST_HEADING),
                  Text('Hallo Hallo Wie Geht es dir?', style: FONT_PARAGRAPH),
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
                              height: 200,
                              width: 150,
                              imageSource: 'https://images.pexels.com/photos/1624487/pexels-photo-1624487.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',)
                          ),
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