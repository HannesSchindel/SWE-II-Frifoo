import 'dart:html';

import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartBox extends StatelessWidget {
  final double _borderRadius = 30.0;
  final double width;
  final double height;

  const ChartBox({required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(_borderRadius),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(4, 4),
            ),
          ],
        ),
        child: Scaffold(
          body: SfCartesianChart(),
        ));
  }
}

/*

   
*/