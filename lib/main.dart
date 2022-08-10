import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'app/routes/app.pages.dart';


void main() {
  runApp(
     GetMaterialApp(
      title: 'TMDB',
      initialRoute: AppPages.INITAL,
      getPages: AppPages.routes,
      )
    );
}
