import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../data/model/transactions.dart';

class ChartPie extends StatelessWidget {
  final List<Transaction> transactions;

  const ChartPie({Key? key, required this.transactions}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: generateSections(),
        borderData: FlBorderData(show: false),
        centerSpaceRadius: 40,
        sectionsSpace: 8, // Add some space between sections
      ),
    );
  }

  List<PieChartSectionData> generateSections() {
    Map<String, double> totalAmounts = {};
    Map<String, int> productCount =
        {}; // Track the count of each product for each kid

    // Calculate total amounts and counts for each product name for each kid
    for (Transaction transaction in transactions) {
      String key = '${transaction.kidName}_${transaction.productName}';
      totalAmounts[key] = (totalAmounts[key] ?? 0) + transaction.price;
      productCount[key] = (productCount[key] ?? 0) + 1;
    }

    // Create PieChartSectionData for each product name for each kid
    List<PieChartSectionData> sections = [];
    int colorIndex = 0;

    for (String key in totalAmounts.keys) {
      List<String> parts = key.split('_');

      String productName = parts[1];
      double? amount = totalAmounts[key];
      int? count = productCount[key];

      sections.add(
        PieChartSectionData(
          color: Colors
              .accents[colorIndex % Colors.accents.length], // Use accent colors
          value: amount,
          title: '$productName\n${amount?.toStringAsFixed(2)}',
          radius: 80,
          titleStyle: const TextStyle(fontSize: 12, color: Colors.white),
          badgeWidget: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.7),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              'Count: ${count ?? 0} ',
              style: const TextStyle(fontSize: 10, color: Colors.white),
            ),
          ),
          badgePositionPercentageOffset: .98, // Adjust badge position
        ),
      );
      colorIndex++;
    }

    return sections;
  }
}
