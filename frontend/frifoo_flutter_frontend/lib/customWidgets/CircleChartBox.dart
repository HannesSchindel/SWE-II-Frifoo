import 'package:flutter/material.dart';
import 'package:frifoo_flutter_frontend/constants.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';

class CircleChartBox extends StatefulWidget {
  final double width;
  final double height;

  CircleChartBox({required this.width, required this.height});

  @override
  State<CircleChartBox> createState() => _CircleChartBoxState();
}

class _CircleChartBoxState extends State<CircleChartBox> {
  late List<Data> _chartData;
  late TooltipBehavior _tooltipBehavior;
  final double _borderRadius = 30.0;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: Color.fromRGBO(255, 255, 255, 1),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 10,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SfCircularChart(
            title: ChartTitle(text: 'nutritional values'),
            legend: Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries>[
              DoughnutSeries<Data, String>(
                  dataSource: _chartData,
                  xValueMapper: (Data data, _) => data.nutrient,
                  yValueMapper: (Data data, _) => data.values,
                  dataLabelSettings: DataLabelSettings(isVisible: true))
            ],
          ),
        ),
      ),
    );
  }

  List<Data> getChartData() {
    final List<Data> chartData = [
      Data('sugar', 18),
      Data('gluten', 8),
      Data('proteins', 100),
      Data('fat', 40),
    ];
    return chartData;
  }
}

class Data {
  Data(this.nutrient, this.values);
  final String nutrient;
  final int values;
}
