import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';

class MainFloatingButton extends StatelessWidget {
  final Icon icon;
  final onPressed;

  const MainFloatingButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FloatingActionButton(
        onPressed: onPressed,
        tooltip: '',
        child: icon,
        backgroundColor: LIGHT_GREEN,
      ),
    );
  }
}
