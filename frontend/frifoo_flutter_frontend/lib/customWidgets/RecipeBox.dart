import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/pages/recipe_page.dart';

class RecipeBox extends StatelessWidget {
  final Map<String, dynamic> recipeData;
  final double _borderRadius = 30.0;
  final double width;
  final double height;
  final bool isFavorite = false;

  const RecipeBox({
    required this.recipeData,
      required this.width,
      required this.height,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => RecipePage(recipeData: recipeData,)));
      },
      child: Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(_borderRadius),
                  image: DecorationImage(
                      image: NetworkImage(recipeData['recipe']['image']), fit: BoxFit.cover)),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_borderRadius),
                color: Colors.white,
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(185, 0, 0, 0),
                  ],
                ),
              ),
            ),
            Container(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Container(
                  margin: const EdgeInsets.all(15),
                  child: DefaultTextStyle(
                      style: FONT_SECOND_WHITE_HEADING, child: Text(recipeData['recipe']['label'])),
                ),
              ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: icon(isFavorite),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

Icon icon(bool isFavorite) {
  if (isFavorite) {
    return Icon(Icons.favorite_rounded, color: Colors.white);
  }
  return Icon(Icons.favorite_border_rounded, color: Colors.white);
} 

/*

   
*/