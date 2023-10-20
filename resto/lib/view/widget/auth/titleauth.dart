import 'package:flutter/material.dart';

import '../../../core/constant/color.dart';

class Titleauth extends StatelessWidget {
  final String headline;
  final String text;

  const Titleauth({Key? key, required this.headline, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headline,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: ColorApp.primaryColor,
              ),
        ),
        const SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: ColorApp.bleu,
              ),
        ),
      ],
    );
  }
}
