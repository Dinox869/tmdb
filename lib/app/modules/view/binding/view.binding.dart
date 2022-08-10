import 'package:get/get.dart';
import 'package:tmdb/app/modules/view/controller/view.controller.dart';

class ViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewController>(
      () => ViewController(),
    );
  }
}