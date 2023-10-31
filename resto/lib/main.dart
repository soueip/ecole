import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/core/constant/routes.dart';
import 'package:resto/core/services/services.dart';
import 'package:resto/routes.dart';
import 'core/locolazition/changelocation.dart';
import 'core/locolazition/translation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    LocaleController controller = Get.put(LocaleController());
    return GetMaterialApp(
      translations: MyTranslation(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: controller.language,
      theme: controller.appTheme,
      initialRoute: AppRoutes.splash,
      routes: routes,
    );
  }
}
