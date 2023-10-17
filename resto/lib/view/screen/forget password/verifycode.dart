import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:resto/view/widget/auth/authbutom.dart';

import '../../../controller/forgetpassword/verifycode.dart';
import '../../../core/constant/color.dart';
import '../../widget/auth/titleauth.dart';
import '../../widget/logoauth.dart';
import '../../widget/textcolored.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({super.key});

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: ColorApp.white,
          elevation: 0.0,
          title: Text('Verification Code ',
              style: Theme.of(context).textTheme.headline4),
          centerTitle: true,
        ),
      ),
      body: Container(
        color: ColorApp.white,
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: ListView(
          children: [
            const LogoAuth(),
            const Titleauth(
              headline: "Check Code",
              text:
                  "Enter the verification code we just sent you on your phone number",
            ),
            const SizedBox(
              height: 10,
            ),
            OtpTextField(
              fieldWidth: 60,
              borderRadius: BorderRadius.circular(10),
              numberOfFields: 5,
              borderColor: const Color.fromARGB(255, 120, 120, 121),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                controller.goToResetPassword();
              }, // end onSubmit
            ),
            const SizedBox(
              height: 10,
            ),
            const Textcolored(
                text1: "if you dont receive code",
                text2: "Resend ",
                onTap: null),
            AuthButton(
              text: "Check",
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
