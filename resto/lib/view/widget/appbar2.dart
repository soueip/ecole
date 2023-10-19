import 'package:flutter/material.dart';

import '../../core/constant/color.dart';

class CustomAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar2({Key? key, required this.title}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: ColorApp.white,
            ),
      ),
      backgroundColor: ColorApp.primaryColor,
    );
  }
}
