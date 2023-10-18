import 'package:flutter/material.dart';
import 'package:resto/core/constant/color.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../widget/appbar.dart';
import '../../widget/rechargebutton.dart';
import 'homepage.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  // Dummy data for financial transactions (replace this with your actual data)
  final List<Transaction> transactions = [
    Transaction(
        productName: 'milk', price: 5, date: '2023-10-18', kidName: 'John Doe'),
    Transaction(
        productName: 'Snack',
        price: 2,
        date: '2023-10-19',
        kidName: 'Jane Doe'),
    Transaction(
        productName: 'Snack',
        price: 4,
        date: '2023-10-20',
        kidName: 'Jane Doe'),
    Transaction(
        productName: 'other',
        price: 10,
        date: '2023-10-23',
        kidName: 'Jane Doe'),

    // Add more transactions as needed
  ];

  ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.title),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  gradient: RadialGradient(
                    center: Alignment.center,
                    radius: 0.9, // Adjust the radius as needed
                    colors: [
                      ColorApp.bleufata7,
                      ColorApp.bleu, // Start color
                      ColorApp.primaryColor, // End color
                    ],
                  ),
                ),
                child: Hero(
                  tag: product.id,
                  child: Image.asset(
                    product.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Container(
                color: ColorApp.primaryColor,
                child: Container(
                  width: double.infinity,
                  height: 500,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: ColorApp.white,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: ColorApp.gris),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.title,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "DT ${product.solde}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 16),
// ...

// Chart for daily money spent
                      SizedBox(
                        height: 300,
                        child: LineChart(
                          LineChartData(
                            gridData: FlGridData(show: true),
                            titlesData: FlTitlesData(
                              bottomTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (context, value) =>
                                    const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                                getTitles: (value) {
                                  if (value >= 0 &&
                                      value < transactions.length) {
                                    // Extracting day and month from the date
                                    DateTime transactionDate = DateTime.parse(
                                        transactions[value.toInt()].date);
                                    String formattedDate =
                                        '${transactionDate.day}-${transactionDate.month}';
                                    return formattedDate;
                                  }
                                  return '';
                                },
                              ),
                              leftTitles: SideTitles(
                                showTitles: true,
                                getTextStyles: (context, value) =>
                                    const TextStyle(
                                  color: Colors.black,
                                  fontSize: 10,
                                ),
                                getTitles: (value) {
                                  return 'DT ${value.toStringAsFixed(0)}';
                                },
                              ),
                              rightTitles: SideTitles(
                                  showTitles: false), // Hide right legend
                              topTitles: SideTitles(
                                  showTitles: false), // Hide top legend
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
                                spots:
                                    List.generate(transactions.length, (index) {
                                  return FlSpot(index.toDouble(),
                                      transactions[index].price);
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
                      )

// ...
                    ],
                  ),
                ),
              ),
            ],
          ),
          const AddButton(),
        ],
      ),
    );
  }
}

class Transaction {
  final String productName;
  final double price;
  final String date;
  final String kidName;

  Transaction({
    required this.productName,
    required this.price,
    required this.date,
    required this.kidName,
  });
}
