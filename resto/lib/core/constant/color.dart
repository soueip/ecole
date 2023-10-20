import 'package:flutter/material.dart';

class ColorApp {
  static const Color black = Color(0xff010622);
  static const Color white = Color(0xffF7F9FB);
  static const Color primaryColor = Color(0xff011D70);
  static const Color gris = Color(0xffA7B3C7);
  static const Color marron = Color(0xff8B7256);
  static const Color gris8ama9 = Color(0xff383B54);
  static const Color bleu = Color(0xff3A60CD);
  static const Color bleufata7 = Color.fromARGB(255, 39, 157, 231);
  static final RadialGradient radialGradient = RadialGradient(
    center: Alignment.center,
    radius: 0.9,
    colors: [
      bleufata7,
      bleu,
      primaryColor,
    ],
  );
}
