import 'package:get/get.dart';

import '../../core/constant/routes.dart';

abstract class SuccessPageController extends GetxController {
  checkcode();
  goToLogin();
}

class SuccessPageControllerImp extends SuccessPageController {
  late String verifycode;

  @override
  checkcode() {}

  @override
  goToLogin() {
    Get.offNamed(AppRoutes.auth);
  }
}
