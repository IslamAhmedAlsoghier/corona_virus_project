import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartReport extends StatelessWidget {
  final Color? iconColor;
  final Map? covidCountryhistoryData;
  String title;

  LineChartReport({
    Key? key,
    this.iconColor,
    this.covidCountryhistoryData,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: getSpotData(),
              isCurved: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
              color: iconColor!,
              barWidth: 4,
            ),
          ])),
    );
  }

  List<FlSpot> getSpotData() {
    if (covidCountryhistoryData == null) {
      return [
        const FlSpot(0, 1),
        const FlSpot(1, 3),
        const FlSpot(2, 0.5),
        const FlSpot(3, 2),
        const FlSpot(4, 2.5),
        const FlSpot(5, 1.4),
        const FlSpot(6, 1.7),
        const FlSpot(7, 1.75),
        const FlSpot(8, 2.2),
        const FlSpot(9, 1.87),
        const FlSpot(10, 1.35),
        const FlSpot(11, 2.6)
      ];
    } else {
      List<FlSpot> list = <FlSpot>[];
      var map = Map<String, dynamic>.from(covidCountryhistoryData![getName()]);
      int i = 0;
      for (var item in map.values) {
        int doubleItem = item;
        list.add(FlSpot(i.toDouble(), doubleItem.toDouble()));
        i++;
      }
      return list;
    }
  }

  String getName() {
    switch (title) {
      case 'CASES':
        return 'cases';
        break;
      case 'DEATHS':
        return 'deaths';
        break;
      case 'RECOVERD':
        return 'recovered';
        break;
      default:
        return ' ';
    }
  }
}
