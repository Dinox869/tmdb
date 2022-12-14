import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/local_storage/db.helper.dart';
import 'package:tmdb/app/providers/tmdb.provider.dart';
import 'package:tmdb/app/services/global.service.dart';
import 'package:tmdb/common/theme.dart' as tm;

import 'app/routes/app.pages.dart';

 initService () async{
  //Initialize Get
  Get.lazyPut(()=>tm.Theme());
  Get.lazyPut(() => DbHelper());
  await Get.putAsync(() => GlobalService().init());
  await Get.putAsync(() => theMovieDatabaseProvider().init());
}

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await initService();
  runApp(
     GetMaterialApp(
      title: 'TMDB',
      initialRoute: AppPages.INITAL,
      getPages: AppPages.routes,
      theme:  Get.find<tm.Theme>().getLightTheme(),
      )
    );
}
