import 'package:flutter/material.dart';
import 'package:resto/core/constant/color.dart';

import '../../widget/appbar.dart';
import 'homepage.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  const ProductDetailsPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: product.title),
      body: ListView(
        children: [
          Container(
            color: ColorApp.primaryColor,
            height: 200,
            width: double.infinity,
            child: Hero(
              tag: product.id,
              child: Image.asset(
                product.image,
                fit: BoxFit.cover,
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
                    "\$${product.solde}",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                  const SizedBox(height: 16),
                  // Add other details here...
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
