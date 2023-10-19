import 'package:flutter/material.dart';
import 'package:resto/core/constant/color.dart';

import '../../../data/model/kidmodel.dart';
import '../../../data/model/transactions.dart';
import '../../widget/appbar.dart';
import '../../widget/chart.dart';
import '../../widget/rechargebutton.dart';
import 'homepage.dart';

class ProductDetailsPage extends StatelessWidget {
  final Kid kid;
  const ProductDetailsPage({Key? key, required this.kid}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: kid.name),
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
                  tag: kid.id,
                  child: Image.asset(
                    kid.image,
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
                        kid.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "DT ${kid.solde}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TransactionChart(transactions: transactions),
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
