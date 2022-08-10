import 'package:get/get.dart';
import 'package:tmdb/app/modules/home/controller/home.controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}