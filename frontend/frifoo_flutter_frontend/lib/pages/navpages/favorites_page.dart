import 'dart:html';
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
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 16.0),
          child: Text(
            "FAVOURITES",
            style: FONT_FIRST_HEADING.copyWith(fontSize: 24.0),
            textAlign: TextAlign.left,
          ),
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
                            width: 200,
                            height: 250,
                            imageSource:
                                'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
                          ),
                        ],
                      ),
                    );
                  },
                )))
      ],
    ));
  }
}




//     return Container(
//       child: GridView.count(
//         crossAxisCount: 2,
//         childAspectRatio: 1.1, // Seitenverhältnis der Widgets bzw. Bilder
//         children: List.generate(20, (index) {
//           return Center(
//             child: ImageBox(
//               height: 200, // Höhe der Widgets bzw. Bilder
//               width: 200, // Breite der Widgets bzw. Bilder
//               imageSource:
//                   'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
//             ),
//           );
//         }),
//       ),
//       // child: Center(
//       //   child: Column( //
//       //     crossAxisAlignment: CrossAxisAlignment.start, // Inhalt linksbündig
//       //     children: [
//       //       Padding(
//       //         padding: const EdgeInsets.only(top: 15.0),
//       //         child: Text(
//       //           "FAVOURITES",
//       //           style: FONT_FIRST_HEADING,
//       //         ),
//       //       ),
//       //       // MainButton(inputText: "Beispieltext"),
//       //       ImageBox(
//       //         height: 300,
//       //         width: 400,
//       //         imageSource:
//       //             'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
//       //       ),
//       //     ],
//       //   ),
//     );
//   }
// }