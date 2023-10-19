import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';
import '../../../data/model/kidmodel.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({Key? key, required this.kid, required this.index})
      : super(key: key);

  final Kid kid;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        Container(
          height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: index.isEven ? ColorApp.bleu : ColorApp.gris8ama9,
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
            tag: kid.id,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 145,
              width: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.asset(
                  kid.image,
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
                    kid.name,
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
                    "Solde est \n ${kid.solde} dt",
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
    );
  }
}
