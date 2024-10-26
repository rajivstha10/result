import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartWidget extends StatefulWidget {
  const PieChartWidget({required this.pyValue, super.key});

  final double pyValue;
  @override
  State<PieChartWidget> createState() => _PieChartWidgetState();
}

Color _getRandomColor() {
  final random = Random();
  return Color.fromARGB(
    255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256),
  );
}

class _PieChartWidgetState extends State<PieChartWidget> {
  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: buildPieChartSections(),
        centerSpaceRadius: 8,
        sectionsSpace: 1,
        borderData: FlBorderData(show: false),
      ),
    );
  }

  double get compareValue => 100 - widget.pyValue;

  // Data for the Pie Chart
  List<PieChartSectionData> buildPieChartSections() {
    return [
      PieChartSectionData(
        value: widget.pyValue,
        color: _getRandomColor(),
        title: '${widget.pyValue.toInt()}%',
        radius: 38,
        titleStyle: const TextStyle(
            fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
      ),
      PieChartSectionData(
        value: compareValue,
        color: _getRandomColor(),
        showTitle: false,
        radius: 35,
        titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
      ),
    ];
  }
}
