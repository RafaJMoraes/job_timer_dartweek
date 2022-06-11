import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ProjectPieChart extends StatelessWidget {
  const ProjectPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        fit: StackFit.loose,
        children: [
          PieChart(PieChartData(sections: [
            PieChartSectionData(
              value: 50,
              color: Theme.of(context).primaryColor,
              showTitle: true,
              title: '50h',
              titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            ),
            PieChartSectionData(
              value: 150,
                color: Theme.of(context).primaryColorLight,
                showTitle: true,
                title: '150h',
                titleStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            )
          ])),
          Align(
            alignment: Alignment.center,
            child: Text(
              '200 H',
              style: TextStyle(
                  fontSize: 25,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }
}
