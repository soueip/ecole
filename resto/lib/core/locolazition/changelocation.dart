import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../constant/apptheme.dart';
import '../services/services.dart';

class LocaleController extends GetxController {
  Locale? language;

  MyServices myServices = Get.find();

  ThemeData appTheme = themeFrensh;

  changeLang(String langcode) {
    Locale locale = Locale(langcode);
    myServices.sharedPreferences.setString("lang", langcode);
    appTheme = langcode == "ar" ? themeArabe : themeFrensh;
    Get.changeTheme(appTheme);
    Get.updateLocale(locale);
  }

  @override
  void onInit() {
    String? sharedPrefLang = myServices.sharedPreferences.getString("lang");
    if (sharedPrefLang == "ar") {
      appTheme = themeArabe;
      language = const Locale("ar");
    } else if (sharedPrefLang == "fr") {
      language = const Locale("fr");
      appTheme = themeFrensh;
    } else {
      language = Locale(Get.deviceLocale!.languageCode);
      appTheme = themeFrensh;
    }
    super.onInit();
  }
}
