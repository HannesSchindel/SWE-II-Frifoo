import 'dart:html';

import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/CircleHeader.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/MainButton.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: [
            CircleHeader(),
            Container(
              margin: const EdgeInsets.all(MAIN_CONTAINER_MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Featured', style: FONT_FIRST_HEADING),
                  Text('Hallo Hallo Wie Geht es dir?', style: FONT_PARAGRAPH)
                ],
              ),
            )
          ],
        ),
    );
  }
}