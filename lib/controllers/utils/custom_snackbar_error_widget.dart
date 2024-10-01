import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'constants.dart';

void showSuccessSnackBar(String message) {
  Get.snackbar(
    "Success",
    message,
    backgroundColor: Colors.green,
    colorText: Colors.white,
    borderRadius: 10,
    snackPosition: SnackPosition.TOP,
    animationDuration: const Duration(milliseconds: 200),
    duration: Duration(milliseconds: snackBarDuration),
  );
}
void showErrorSnackBar(String message) {
  Get.snackbar(
    "Error",
    message,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    borderRadius: 10,
    snackPosition: SnackPosition.TOP,
    animationDuration: const Duration(milliseconds: 200),
    duration: Duration(milliseconds: snackBarDuration),
  );
}