import 'package:get/get.dart';

import '../core/constant/routes.dart';

abstract class NavbarController extends GetxController {
  void gotohomepage();
  void recharge();
  //void goToForgetPassword();
}

class NavbarControllerImp extends NavbarController {
  @override
  void gotohomepage() {
    Get.toNamed(AppRoutes.homepage);
  }

  @override
  void recharge() {
    Get.toNamed(AppRoutes.recharge);
  }
}
