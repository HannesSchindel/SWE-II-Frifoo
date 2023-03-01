import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';

class ImageBox extends StatelessWidget {
  final double _borderRadius = 30.0;
  final double width;
  final double height;
  final String imageSource;
  final String title;
  final bool isFavorite;

  const ImageBox({required this.width, required this.height, required this.imageSource, required this.title, required this.isFavorite});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              image: DecorationImage(image: NetworkImage(imageSource), fit: BoxFit.cover)
            ),
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: Text(title, style: FONT_SECOND_WHITE_HEADING,),
                ),
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.all(15),
                  child: icon(isFavorite),
                )
              ]
              ),
          )
        ],
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