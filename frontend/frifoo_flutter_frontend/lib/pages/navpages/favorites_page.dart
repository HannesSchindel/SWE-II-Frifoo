import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            Text("Favourites"),
            MainButton(inputText: "Beispieltext"),
            ImageBox(
              height: 300,
              width: 400,
              imageSource:
                  'https://images.pexels.com/photos/566566/pexels-photo-566566.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}
