import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/common/theme.dart' as tm;

import 'app/routes/app.pages.dart';


void main() {
  Get.lazyPut(()=>tm.Theme());
  runApp(
     GetMaterialApp(
      title: 'TMDB',
      initialRoute: AppPages.INITAL,
      getPages: AppPages.routes,
      theme:  Get.find<tm.Theme>().getLightTheme(),
      )
    );
}
