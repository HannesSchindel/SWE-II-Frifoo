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
                  'https://cdn.kisikates.com.tr/image-cache/cache/recipe_main_image_large/https---cdn.kisikates.com.tr/recipe-media/8d35632c3965b0e910325bd6ab9a43996d32b61e.jpeg',
            ),
          ],
        ),
      ),
    );
  }
}
