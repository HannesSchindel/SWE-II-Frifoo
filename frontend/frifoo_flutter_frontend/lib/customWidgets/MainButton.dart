import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final String inputText;
  final onPressed;

  const MainButton({required this.inputText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.4,
      height: 50,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              Color(0xff55A38F),
              Color(0xff47D65E),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(4, 4),
           ),
         ],
      ),
      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          inputText,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      )

    );
  }
}