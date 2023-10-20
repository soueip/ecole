import 'package:flutter/material.dart';
import 'package:resto/core/constant/routes.dart';
import 'package:resto/view/screen/auth/forget%20password/forgetpass.dart';
import 'package:resto/view/screen/auth/forget%20password/resetpassword.dart';
import 'package:resto/view/screen/auth/forget%20password/successpage.dart';
import 'package:resto/view/screen/auth/forget%20password/verifycode.dart';
import 'package:resto/view/screen/home/adminepage.dart';
import 'package:resto/view/screen/rechargepage.dart';

import 'package:resto/view/screen/splash.dart';

import 'view/screen/auth/auth.dart';
import 'view/screen/home/homepage.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoutes.auth: (context) => const Auth(),
  AppRoutes.splash: (context) => const Splash(),
  AppRoutes.forgetpassword: (context) => const ForgetPassword(),
  AppRoutes.verfiyCode: (context) => const VerfiyCode(),
  AppRoutes.resetPassword: (context) => const ResetPassword(),
  AppRoutes.successpage: (context) => const SuccessPassPage(),
  AppRoutes.homepage: (context) => const HomePage(),
  AppRoutes.adminhomepage: (context) => const AdminHomepage(),
  AppRoutes.recharge: (context) => const Recharge(),
};
