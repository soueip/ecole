import 'package:flutter/material.dart';
import 'package:resto/core/constant/color.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const AuthButton({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: MaterialButton(
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(vertical: 13),
        textColor: ColorApp.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Ink(
          decoration: BoxDecoration(
            gradient: ColorApp.gridnet,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            constraints: const BoxConstraints(
              maxWidth: 300.0,
              minHeight: 50.0,
            ),
            alignment: Alignment.center,
            child: Text(
              text,
              style: const TextStyle(
                color: ColorApp.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
