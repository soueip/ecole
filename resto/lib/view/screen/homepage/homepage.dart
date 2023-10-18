import 'package:flutter/material.dart';
import 'package:resto/core/constant/color.dart';
import '../../../core/constant/imageasset.dart';
import '../../../core/functions/navigationtodetails.dart';
import '../../widget/appbar.dart';

class Product {
  final String id;
  final String title;
  final double solde;
  final String image;

  Product(
      {required this.id,
      required this.title,
      required this.solde,
      required this.image});
}

// Existing code...

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Product> products = [
      Product(
          id: '1', title: 'mohamed alii', solde: 10.99, image: ImageAsset.boy1),
      Product(id: '2', title: 'Yasmine ', solde: 15.99, image: ImageAsset.boy2),
      Product(id: '3', title: 'Yassine', solde: 22.99, image: ImageAsset.girl1),
      // Add more products as needed
    ];

    return Scaffold(
      appBar: const CustomAppBar(title: 'sélectionnez votre enfant'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 145,
            child: Image.asset(
              ImageAsset.appbar,
              fit: BoxFit.fitWidth,
            ),
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: products.length,
              itemBuilder: (context, index) {
                Product product = products[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: InkWell(
                    onTap: () {
                      NavigateToProductDetails(context, product);
                    },
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: <Widget>[
                        Container(
                          height: 140,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: index.isEven
                                ? ColorApp.bleu
                                : ColorApp.gris8ama9,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 5),
                                blurRadius: 10,
                              ),
                            ],
                          ),
                          child: ClipRect(
                            child: OverflowBox(
                              alignment: Alignment.topCenter,
                              maxHeight: double.infinity,
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Hero(
                            tag: product.id,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              height: 145,
                              width: 180,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          child: SizedBox(
                            height: 120,
                            width: 250,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                  ),
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    product.title,
                                    style: const TextStyle(
                                      color: ColorApp.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 5,
                                  ),
                                  decoration: const BoxDecoration(
                                    color: ColorApp.gris8ama9,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                      topRight: Radius.circular(12),
                                    ),
                                  ),
                                  child: Text(
                                    "solede est \n ${product.solde} dt",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
