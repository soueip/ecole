import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/core/constant/imageasset.dart';

import '../../controller/login.dart';
import '../../core/constant/color.dart';
import '../../core/functions/validinput.dart';
import '../widget/appbar.dart';
import '../widget/auth/authbutom.dart';
import '../widget/auth/textformauth.dart';

class Recharge extends StatelessWidget {
  const Recharge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginControllerImp controller = Get.put(LoginControllerImp());
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.email.clear();
    });

    return Scaffold(
      appBar: const CustomAppBar(title: 'Rechargez le Compte'),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.8,
                colors: [
                  ColorApp.bleufata7,
                  ColorApp.primaryColor,
                ],
              ),
            ),
          ),
          Positioned(
            top: 160,
            left: 30,
            child: Container(
              height: 390,
              width: 350,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: ColorApp.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormAuth(
                    isNumber: false,
                    valid: (val) {
                      return validInput(val!, "solde", 1, 3);
                    },
                    text: "Solde",
                    hinttext: "Entrez le montant de la recharge",
                    iconData: Icons.money_rounded,
                    mycontroller: controller.email,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Select Payment Method',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: ColorApp.gris8ama9,
                        ),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    hint: const Text('Select Payment Method'),
                    items: ['Sure Place'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      // Handle payment method selection
                    },
                  ),
                  const SizedBox(height: 30),
                  AuthButton(
                    text: "Recharge",
                    onPressed: () {
                      // controller.login();
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: -30,
            left: 0,
            right: 0,
            child: Image.asset(
              ImageAsset.recharge,
              height: 250,
              width: 250,
            ),
          ),
        ],
      ),
    );
  }
}
