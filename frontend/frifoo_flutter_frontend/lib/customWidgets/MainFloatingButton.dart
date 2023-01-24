import 'package:flutter/material.dart';

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
        backgroundColor: Color(0xff47D65E),
       ),
    );
  }
}