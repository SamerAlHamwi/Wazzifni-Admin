


import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:wazzifni_admin/core/common/style/padding_insets.dart';
import 'package:wazzifni_admin/core/constants/appcolors.dart';


class JobApplicationsChart extends StatelessWidget {
  const JobApplicationsChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: PaddingInsets.bigPaddingAll,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryColor),
        boxShadow: AppColors.boxShadow2,
      ),
      padding: PaddingInsets.bigPaddingAll,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'applied_jobs'.tr(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('(${'this_month'.tr()})', style: TextStyle(color: Colors.grey)),
                ],
              ),
              Text(
                '4029',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: LineChart(
              LineChartData(
                gridData: FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          '04/${value.toInt()}',
                          style: TextStyle(fontSize: 10, color: Colors.grey),
                        );
                      },
                      interval: 5,
                      reservedSize: 22,
                    ),
                  ),
                ),
                borderData: FlBorderData(
                  show: true,
                  border: Border.all(color: Colors.grey.withOpacity(0.3)),
                ),
                lineBarsData: [
                  LineChartBarData(
                    spots: [
                      FlSpot(1, 600),
                      FlSpot(5, 750),
                      FlSpot(10, 450),
                      FlSpot(15, 605),
                      FlSpot(20, 300),
                      FlSpot(25, 800),
                      FlSpot(30, 900),
                    ],
                    isCurved: true,
                    color: Colors.blue,
                    barWidth: 3,
                    isStrokeCapRound: true,
                    belowBarData: BarAreaData(
                      show: true,
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue.withOpacity(0.3),
                          Colors.transparent,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    dotData: FlDotData(
                      show: true,
                      getDotPainter: (spot, percent, barData, index) {
                        return FlDotCirclePainter(
                          radius: 4,
                          color: Colors.white,
                          strokeColor: Colors.blue,
                          strokeWidth: 2,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



