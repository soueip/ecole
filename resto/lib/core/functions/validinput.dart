import 'package:get/get.dart';

validInput(
  String val,
  String type,
  int min,
  int max,
) {
  if (type == "username") {
    if (!GetUtils.isUsername(val)) {
      return "user name non valide";
    }
  }

  if (type == "email") {
    if (!GetUtils.isEmail(val)) {
      return "email non valide";
    }
  }
  if (type == "phone") {
    if (!GetUtils.isPhoneNumber(val)) {
      return " phone non valide";
    }
  }
  if (val.isEmpty) {
    return "  valeur est vide";
  }
  if (val.length < min) {
    return "  minimum est $min";
  }
  if (val.length > max) {
    return "  minimum est $max";
  }
}
