import 'dart:html';
import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class ChartBox extends StatefulWidget {
  final double width;
  final double height;

  ChartBox({required this.width, required this.height});

  @override
  _ChartBoxState createState() => _ChartBoxState();
}

class _ChartBoxState extends State<ChartBox> {
  final List<SalesData> _chartData = getChartData();
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(enable: true);
  final double _borderRadius = 30.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
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
        body: SfCartesianChart(
          title: ChartTitle(text: 'Yearly sales analysis'),
          legend: Legend(isVisible: true),
          tooltipBehavior: _tooltipBehavior,
          series: <SplineSeries>[
            SplineSeries<SalesData, double>(
                name: 'Sales',
                dataSource: _chartData,
                xValueMapper: (SalesData sales, _) => sales.year,
                yValueMapper: (SalesData sales, _) => sales.sales,
                dataLabelSettings: DataLabelSettings(isVisible: true),
                enableTooltip: true,
                color: Colors.green,
                width: 3,
                opacity: 1,
                splineType: SplineType.cardinal,
                cardinalSplineTension: 0.5)
          ],
          primaryXAxis:
              NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
          primaryYAxis: NumericAxis(
              labelFormat: '{value}M',
              numberFormat:
                  NumberFormat.compactSimpleCurrency(decimalDigits: 0)),
        ),
      ),
    );
  }

  static List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(2017, 25),
      SalesData(2018, 12),
      SalesData(2019, 24),
      SalesData(2020, 18),
      SalesData(2021, 30)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
