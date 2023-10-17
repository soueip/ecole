import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/forgetpassword/resetpassword.dart';
import '../../../core/constant/color.dart';
import '../../../core/functions/validinput.dart';
import '../../widget/auth/authbutom.dart';
import '../../widget/auth/textformauth.dart';
import '../../widget/auth/titleauth.dart';
import '../../widget/logoauth.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    ResetPasswordControllerImp controller =
        Get.put(ResetPasswordControllerImp());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: ColorApp.white,
          elevation: 0.0,
          title: Text('Reset Password',
              style: Theme.of(context).textTheme.titleLarge),
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
                headline: "Change Password",
                text: "",
              ),
              TextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, "password", 8, 30);
                  },
                  text: "New Password",
                  hinttext: " New password",
                  iconData: Icons.email_outlined,
                  mycontroller: controller.newpassword),
              TextFormAuth(
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, "confirmpassword", 8, 30);
                  },
                  text: "Confirm Your Password",
                  hinttext: "Confirm  your password",
                  iconData: Icons.email_outlined,
                  mycontroller: controller.confirmnewpassword),
              AuthButton(
                text: "Check",
                onPressed: () {
                  controller.goToSuccesspage();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
