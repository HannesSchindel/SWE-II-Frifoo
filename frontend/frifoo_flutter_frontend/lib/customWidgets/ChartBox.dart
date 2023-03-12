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
        backgroundColor: Colors.transparent,
        body: SfCartesianChart(
          title: ChartTitle(text: 'overview calories'),
          legend: Legend(isVisible: true),
          tooltipBehavior: _tooltipBehavior,
          series: <SplineSeries>[
            SplineSeries<SalesData, double>(
                name: 'calories',
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
              labelFormat: '{value}kcal',
              numberFormat:
                  NumberFormat.compactSimpleCurrency(decimalDigits: 0)),
        ),
      ),
    );
  }

  static List<SalesData> getChartData() {
    final List<SalesData> chartData = [
      SalesData(1, 2500),
      SalesData(2, 4000),
      SalesData(3, 3000),
      SalesData(4, 3500),
      SalesData(5, 2000),
      SalesData(6, 2300),
      SalesData(7, 1900)
    ];
    return chartData;
  }
}

class SalesData {
  SalesData(this.year, this.sales);
  final double year;
  final double sales;
}
