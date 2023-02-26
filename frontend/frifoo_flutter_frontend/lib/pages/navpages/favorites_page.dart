import 'dart:async';
import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(20, (index) {
          return Center(
            child: ImageBox(
              height: 200,
              width: 200,
              imageSource:
                  'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
            ),
          );
        }),
      ),
      // child: Center(
      //   child: Column( //
      //     crossAxisAlignment: CrossAxisAlignment.start, // Inhalt linksbündig
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.only(top: 15.0),
      //         child: Text(
      //           "FAVOURITES",
      //           style: FONT_FIRST_HEADING,
      //         ),
      //       ),
      //       // MainButton(inputText: "Beispieltext"),
      //       ImageBox(
      //         height: 300,
      //         width: 400,
      //         imageSource:
      //             'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
      //       ),
      //     ],
      //   ),
    );
  }
}
