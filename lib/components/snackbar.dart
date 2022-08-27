import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController snackbarSuccess(message) {
  return Get.snackbar(
    'success',
    message,
    backgroundColor: const Color(0xff28C397),
    colorText: Colors.white,
  );
}

SnackbarController snackbarError(message) {
  return Get.snackbar(
    'error',
    message,
    backgroundColor: Colors.red[700],
    colorText: Colors.white,
  );
}
