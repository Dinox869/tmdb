import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/local_storage/db.helper.dart';
import 'package:tmdb/app/model/profile.model.dart';
import 'package:tmdb/app/modules/details/controller/details.controller.dart';
import 'package:tmdb/app/modules/home/controller/home.controller.dart';

class ViewController extends GetxController {

final profile =  Profiles().obs;
final imagePath = 'https://image.tmdb.org/t/p/original'.obs;
final images = <Profiles>[].obs;
final save = false.obs;

  @override
  void onInit() {
    // Fetch local data
    getProfiles();
    var arguments = Get.arguments as Map<String, dynamic>;
    profile.value = arguments['profile'];
    
    super.onInit();
  }

    Color getFontColorForBackground() => (Color(int.parse(Get.find<DetailsController>().color.value)).computeLuminance() > 0.179)? Colors.black : Colors.white;

    String profileUrl() => imagePath + profile.value.filePath!;

    getProfiles() async {
      images.value = await Get.find<DbHelper>().getProfileList();
      //Check if the image exist in DB
      exist();
      }

    addProfile() {
      Get.find<DbHelper>().insertModel(profile.value);
      Get.find<HomeController>().getProfiles();
      save.value = false;
    }

    exist() {
      images.firstWhere((saved) => saved.filePath == profile.value.filePath!, orElse: () {
        save.value = true;
        return profile.value;
      },);
    }

    
}