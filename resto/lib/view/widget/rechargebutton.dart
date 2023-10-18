import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/core/constant/color.dart';

import '../screen/rechargepage.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    double buttonXPosition = MediaQuery.of(context).size.width / 1.35;

    return Positioned(
      left: buttonXPosition,
      top: 20,
      child: GestureDetector(
        onTap: () => _navigateToRecharge(context),
        child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: ColorApp.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            children: [
              Container(
                width: 55,
                height: 55,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorApp.bleu, // Fix typo in color name
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              const Text("Recharge"),
            ],
          ),
        ),
      ),
    );
  }

  void _navigateToRecharge(BuildContext context) {
    Get.to(() => const Recharge());
  }
}
