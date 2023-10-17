import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class SplashController {
  void navigateToHome();
}

class SplashControllerImp extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void onInit() {
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5));

    super.onInit();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  startAnimation() {
    animationController.repeat();
  }
}
