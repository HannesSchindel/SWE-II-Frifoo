import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ChartBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(
                left: MAIN_CONTAINER_MARGIN,
                right: MAIN_CONTAINER_MARGIN,
                bottom: MAIN_CONTAINER_MARGIN),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Statistics', style: FONT_FIRST_HEADING),
                Text(
                    'Here you have an overview of all the nutritional values and calories of the last dishes.',
                    style: FONT_PARAGRAPH),
                Container(
                    child: ChartBox(
                  height: 300,
                  width: 400,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
