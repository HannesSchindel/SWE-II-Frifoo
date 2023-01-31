import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: [
            Container(
              margin: const EdgeInsets.all(MAIN_CONTAINER_MARGIN),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Statistics', style: FONT_LOGO_BLACK_HEADING),
                  Text('Fick Mütter ich bin raus keine Lust mehr!', style: FONT_PARAGRAPH)
                ],
              ),
            )
          ],
        ),
    );
  }
}