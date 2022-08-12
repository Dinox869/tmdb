import 'package:get/get.dart';
import 'package:tmdb/app/modules/details/binding/details.binding.dart';
import 'package:tmdb/app/modules/details/view/details.view.dart';
import 'package:tmdb/app/modules/home/binding/home.binding.dart';
import 'package:tmdb/app/modules/home/view/home.view.dart';
import 'package:tmdb/app/modules/view/binding/view.binding.dart';
import 'package:tmdb/app/modules/view/view/view.view.dart';
import 'package:tmdb/app/routes/routes.dart';

class AppPages {
  static const INITAL = '/home';

// Routes to modules
  static final routes = [
    GetPage(
        name: Routes.HOME,
        page: () => const HomeView(),
        binding: HomeBinding(),
        ),

    GetPage(
      name: Routes.DETAILS,
      page: () => const Details(),
      binding: DetailBinding(),
    ),

    GetPage(
      name: Routes.VIEW,
      page: () => const View(),
      binding: ViewBinding(),
    ),
    
  ];
}