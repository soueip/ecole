import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/routes.dart';

abstract class LoginController extends GetxController {
  void login();
  //void signup();
  //void goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;
  late TextEditingController password;

  bool isVisiblepass = true;

  void showPassword() {
    isVisiblepass = !isVisiblepass;
    update();
  }

  @override
  Future<void> onInit() async {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Future<void> login() async {
    if (formstate.currentState!.validate()) {
      try {
        await Future.delayed(const Duration(seconds: 1));

        String userEmail = email.text.toLowerCase();

        if (userEmail.contains('admin')) {
          Get.offAllNamed(AppRoutes.adminhomepage);
        } else {
          Get.offAllNamed(AppRoutes.homepage);
        }
      } catch (e) {
        Get.snackbar(
          snackPosition: SnackPosition.BOTTOM,
          'Error',
          'An error occurred. Please check your internet connection or try again later.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }
  }

  void goToForgetPassword() {
    Get.toNamed(AppRoutes.forgetpassword);
  }
}
