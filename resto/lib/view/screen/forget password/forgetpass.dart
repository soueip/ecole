import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/forgetpassword/forgetpassword.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/authbutom.dart';
import '../../widget/auth/textformauth.dart';
import '../../widget/auth/titleauth.dart';
import '../../widget/logoauth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ForgetPasswordControllerImp controller =
        Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: ColorApp.white,
          elevation: 0.0,
          title: Text(
            'Forget Password',
            style: Theme.of(context).textTheme.headline4?.copyWith(
                  color: ColorApp.bleu,
                ),
          ),
          centerTitle: true,
        ),
      ),
      body: Container(
        color: ColorApp.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Form(
          key: controller.formstate,
          child: ListView(
            children: [
              const LogoAuth(),
              const Titleauth(
                headline: "Check Email",
                text:
                    "Please Enter Your Email Address To Recive A Verification Code",
              ),
              const SizedBox(height: 20),
              TextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, "email", 5, 25);
                  },
                  text: "Email",
                  hinttext: "Enter Your Email",
                  iconData: Icons.email_outlined,
                  mycontroller: controller.email),
              AuthButton(
                text: "Check",
                onPressed: () {
                  controller.goToVerfiyCode();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
