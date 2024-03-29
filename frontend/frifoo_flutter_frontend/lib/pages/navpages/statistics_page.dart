import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ChartBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/CircleChartBox.dart';
import 'package:frifoo_flutter_frontend/customWidgets/ImageBox.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
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
                Text('Statistics', style: FONT_PAGE_HEADING),
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
          Container(
            margin: const EdgeInsets.only(
                left: MAIN_CONTAINER_MARGIN,
                right: MAIN_CONTAINER_MARGIN,
                bottom: MAIN_CONTAINER_MARGIN),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('nutritional values', style: FONT_PARAGRAPH),
                Container(
                  child: CircleChartBox(
                    width: 300,
                    height: 400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
