import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resto/core/constant/color.dart';

Future<bool> alertExitApp() async {
  final result = await Get.defaultDialog(
    title: "Alerte",
    titleStyle: const TextStyle(
        color: ColorApp.primaryColor, fontWeight: FontWeight.bold),
    middleText: "Voulez-vous quitter l'application ?",
    actions: [
      ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              const Color.fromARGB(255, 255, 255, 255)),
          side: MaterialStateProperty.all(
              const BorderSide(color: Colors.red)), // Red border
          foregroundColor: MaterialStateProperty.all(Colors.red), // Text color
        ),
        onPressed: () {
          exit(0);
        },
        child: const Text("Quitter"),
      ),
      ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(ColorApp.white),
        ),
        onPressed: () {
          Get.back();
        },
        child: const Text(
          "Annulée",
          style: TextStyle(color: ColorApp.bleu),
        ),
      ),
    ],
  );
  return result ?? false;
}
