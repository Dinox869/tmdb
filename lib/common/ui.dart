import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UI {
    static GetSnackBar errorSnackBar({String title = 'Note', String? message}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(title.tr,
          style: Get.textTheme.headline6?.merge(const TextStyle(color: Colors.white))),
      messageText: Text(message!,
          style: Get.textTheme.caption?.merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.black,
      icon: Icon(Icons.remove_circle_outline,
          size: 32, color: Get.theme.primaryColor),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }
}