import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';

class CircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}


class RecipeHeader extends StatelessWidget {
  final String imageurl;
  final String title;

  const RecipeHeader({super.key, required this.imageurl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: ClipPath(
        clipper: CircleClipper(),
        child: Container(
          height: 200,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageurl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: 350,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                    Color.fromARGB(0, 0, 0, 0),
                    Color.fromARGB(230, 0, 0, 0),
                  ],
                ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: FONT_LOGO_HEADING,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// 'https://images.pexels.com/photos/1640772/pexels-photo-1640772.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')