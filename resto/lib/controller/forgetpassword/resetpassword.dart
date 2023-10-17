import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/core/constant/routes.dart';

abstract class ResetPasswordController extends GetxController {
  resetpassword();
  goToSuccesspage();
}

class ResetPasswordControllerImp extends ResetPasswordController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  late TextEditingController newpassword;
  late TextEditingController confirmnewpassword;
  @override
  resetpassword() {
    var formdata = formstate.currentState;
    if (formdata!.validate()) {
      print("cest  valide");
    } else {
      print("cest valide");
    }
  }

  @override
  goToSuccesspage() {
    Get.offNamed(AppRoutes.successpage);
  }

  @override
  void onInit() {
    newpassword = TextEditingController();
    confirmnewpassword = TextEditingController();

    super.onInit();
  }

  @override
  void dispose() {
    newpassword.dispose();
    confirmnewpassword.dispose();

    super.dispose();
  }
}
