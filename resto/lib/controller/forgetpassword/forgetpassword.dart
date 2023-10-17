import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:resto/core/constant/routes.dart';

abstract class ForgetPasswordController extends GetxController {
  checkemail();
  goToVerfiyCode();
}

class ForgetPasswordControllerImp extends ForgetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController email;

  @override
  checkemail() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("cest  valide");
    } else {
      print("cest pas valide");
    }
  }

  @override
  goToVerfiyCode() {
    Get.offNamed(AppRoutes.verfiyCode);
  }

  @override
  void onInit() {
    email = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();

    super.dispose();
  }
}
