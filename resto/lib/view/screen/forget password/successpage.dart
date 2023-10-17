import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../controller/forgetpassword/successpage.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/authbutom.dart';
import '../../widget/auth/titleauth.dart';

class SuccessPassPage extends StatelessWidget {
  const SuccessPassPage({super.key});

  @override
  Widget build(BuildContext context) {
    SuccessPageController controller = Get.put(SuccessPageControllerImp());
    return Scaffold(
      body: Container(
        color: ColorApp.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const SizedBox(
              height: 30,
            ),
            const Center(
              child: FaIcon(
                FontAwesomeIcons.circleCheck,
                size: 100,
                color: Color(0xff29CA8C),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            const Titleauth(
              headline: "Le Mot de Passe a été Changé Avec Succès",
              text: "Get help to write a will, make a power of attorney",
            ),
            const SizedBox(height: 20),
            AuthButton(
              text: "Go To Login",
              onPressed: () {
                controller.goToLogin();
              },
            ),
          ],
        ),
      ),
    );
  }
}
