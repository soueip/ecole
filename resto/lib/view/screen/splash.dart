import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/controller/splachcontroller.dart';
import 'package:resto/core/constant/color.dart';
import 'package:resto/core/constant/routes.dart';

import '../../core/constant/imageasset.dart';

class Splash extends GetView<SplashControllerImp> {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double top1 = 200;
    double top2 = 400;

    Future.delayed(const Duration(seconds: 3), (() {
      Get.offAllNamed(AppRoutes.auth);
    }));

    return Scaffold(
      backgroundColor: ColorApp.white, // Set the background color
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Improved animation for the logo
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              top: top1,
              child: Image.asset(
                ImageAsset.splash,
                scale: 1.5, // Adjust the scale for your logo
                fit: BoxFit.contain, // Use 'contain' for logos
              ),
            ),
            const SizedBox(height: 20), // Reduce the spacing

            // Improved animation for the welcome text
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              top: top2,
              child: Text(
                'Bienvenue',
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: ColorApp.bleu,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
