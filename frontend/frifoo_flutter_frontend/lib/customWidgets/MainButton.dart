import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';

class MainButton extends StatelessWidget {
  final String inputText;
  final void Function()? onPressed;

  const MainButton({required this.inputText, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / WIDTH_DIVIDER,
      height: 50,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: <Color>[
              DARK_GREEN,
              LIGHT_GREEN,
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