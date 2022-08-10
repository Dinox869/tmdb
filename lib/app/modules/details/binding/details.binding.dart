
import 'package:get/get.dart';
import 'package:tmdb/app/modules/details/controller/details.controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(
      () => DetailsController(),
    );
  }
}