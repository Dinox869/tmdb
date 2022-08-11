import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/details/controller/details.controller.dart';

class ViewController extends GetxController {

final personUrl =  ''.obs;

  @override
  void onInit() {
    var arguments = Get.arguments as Map<String, dynamic>;
    personUrl.value = arguments['personUrl'];
    super.onInit();
  }

Color getFontColorForBackground() {
  return (Color(int.parse(Get.find<DetailsController>().color.value)).computeLuminance() > 0.179)? Colors.black : Colors.white;
}
  
}