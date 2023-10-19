import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../data/model/transactions.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionChart({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            bottomTitles: SideTitles(
              showTitles: true,
              getTextStyles: (context, value) => const TextStyle(
                color: Colors.black,
                fontSize: 12,
              ),
              getTitles: (value) {
                if (value >= 0 && value < transactions.length) {
                  DateTime transactionDate =
                      DateTime.parse(transactions[value.toInt()].date);
                  String formattedDate =
                      '${transactionDate.day}-${transactionDate.month}';
                  return formattedDate;
                }
                return '';
              },
            ),
            leftTitles: SideTitles(
              showTitles: true,
              getTextStyles: (context, value) => const TextStyle(
                color: Colors.black,
                fontSize: 10,
              ),
              getTitles: (value) {
                return 'DT ${value.toStringAsFixed(0)}';
              },
            ),
            rightTitles: SideTitles(
              showTitles: false,
            ),
            topTitles: SideTitles(
              showTitles: false,
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(
              color: Colors.grey,
              width: 0.5,
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: List.generate(transactions.length, (index) {
                return FlSpot(index.toDouble(), transactions[index].price);
              }),
              isCurved: true,
              colors: [Colors.blue],
              dotData: FlDotData(show: true),
              belowBarData: BarAreaData(show: false),
              aboveBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
