import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [Text("Home"), MainButton(inputText: "Hi")],
        ),
      ),
    );
  }
}
