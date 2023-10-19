import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/controller/login.dart';
import 'package:resto/core/constant/color.dart';

import '../../../core/functions/alertexitapp.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/authbutom.dart';
import '../../widget/auth/logoauth.dart';
import '../../widget/auth/textformauth.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    return Scaffold(
      body: WillPopScope(
        onWillPop: alertExitApp,
        child: Container(
          color: ColorApp.white,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Form(
            key: controller.formstate,
            child: ListView(
              children: [
                const LogoAuth(),
                Text(
                  "Application mobile parentale",
                  textAlign: TextAlign.start,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: ColorApp.bleu,
                      ),
                ),
                const SizedBox(height: 30),
                TextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, "email", 5, 30);
                  },
                  text: "Email",
                  hinttext: "Entre Votre Email",
                  iconData: Icons.email_outlined,
                  mycontroller: controller.email,
                ),
                GetBuilder<LoginControllerImp>(
                  builder: (controller) => TextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, "password", 8, 30);
                    },
                    obscureText: controller.isVisiblepass,
                    onTapIcon: () {
                      controller.showPassword();
                    },
                    text: "Mot De Pass",
                    hinttext: "Entre Votre Mot De Pass",
                    iconData: Icons.visibility,
                    mycontroller: controller.password,
                  ),
                ),
                InkWell(
                    onTap: () {
                      controller.goToForgetPassword();
                    },
                    child: Text(
                      "Mot de passe oublié ?",
                      textAlign: TextAlign.end,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: ColorApp.marron,
                          ),
                    )),
                AuthButton(
                  text: "Se connecter",
                  onPressed: () {
                    controller.login();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
