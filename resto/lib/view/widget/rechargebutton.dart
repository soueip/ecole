import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/core/constant/color.dart';

import '../screen/rechargepage.dart';

class AddButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double buttonXPosition = MediaQuery.of(context).size.width / 1.24;

    return Positioned(
      left: buttonXPosition,
      bottom: 20,
      child: Column(
        children: [
          Text("recharge"),
          SizedBox(
            height: 10,
          ),
          GestureDetector(
            onTap: () {
              Get.to(
                () => Recharge(),
              );
            },
            child: Container(
              width: 55,
              height: 55,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorApp.bleu,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
