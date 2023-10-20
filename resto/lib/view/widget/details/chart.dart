import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import 'package:resto/core/constant/color.dart';
import '../../../data/model/transactions.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionChart({Key? key, required this.transactions})
      : super(key: key);

  FlTitlesData _buildTitlesData() {
    return FlTitlesData(
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
            String formattedDate = _formatDate(transactionDate);
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
    );
  }

  String _formatDate(DateTime date) {
    return DateFormat('d-M').format(date);
  }

  FlBorderData _buildBorderData() {
    return FlBorderData(
      show: true,
      border: Border.all(
        color: ColorApp.gris,
        width: 0.5,
      ),
    );
  }

  LineChartBarData _buildLineChartBarData() {
    return LineChartBarData(
      spots: List.generate(transactions.length, (index) {
        return FlSpot(index.toDouble(), transactions[index].price);
      }),
      isCurved: true,
      colors: [ColorApp.gris8ama9],
      dotData: FlDotData(show: true),
      belowBarData: BarAreaData(
        show: true,
        colors: [Color.fromARGB(75, 1, 29, 112)], // Set the color here
      ),
      aboveBarData: BarAreaData(show: false),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: _buildTitlesData(),
          borderData: _buildBorderData(),
          lineBarsData: [_buildLineChartBarData()],
        ),
      ),
    );
  }
}
