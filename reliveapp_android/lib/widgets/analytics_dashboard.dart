import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsDashboard extends StatelessWidget {
  final List<double> data;

  const AnalyticsDashboard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Analytics Dashboard',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: SfCartesianChart(
                primaryXAxis: NumericAxis(),
                series: <LineSeries<double, int>>[
                  LineSeries<double, int>(
                    dataSource: data,
                    xValueMapper: (double value, int index) => index,
                    yValueMapper: (double value, _) => value,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
