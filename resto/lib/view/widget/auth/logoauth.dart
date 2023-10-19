import 'package:flutter/material.dart';

import '../../../core/constant/imageasset.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      ImageAsset.logo,
      scale: 2,
      height: 150,
    );
  }
}
