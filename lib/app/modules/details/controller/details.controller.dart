import 'package:get/get.dart';

class DetailsController extends GetxController{
  final color = ''.obs;

  @override
  void onInit() {
    var arguments = Get.arguments as Map<String, dynamic>;
    color.value = arguments['color'];
    super.onInit();
  }

  
}