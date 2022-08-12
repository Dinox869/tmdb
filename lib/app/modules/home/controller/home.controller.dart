import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/local_storage/db.helper.dart';
import 'package:tmdb/app/model/profile.model.dart';
import 'package:tmdb/app/model/response.model.dart' as pop;
import 'package:tmdb/app/model/results.model.dart';
import 'package:tmdb/app/repository/person.repository.dart';
import 'package:tmdb/common/ui.dart';

class HomeController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final double sigmaX = 0.0; 
  final double sigmaY = 0.0; 
  final double opacity = 0.6; 
  final loading = true.obs;
  final secondaryLoading = false.obs;
  final pages = 1.obs;
  late PersonRepository _personRepository;
  final people = <Results>[].obs;
  late ScrollController scrollController;
  final imagePath = 'https://image.tmdb.org/t/p/original'.obs;
  final images = <Profiles>[].obs;
  final offline = false.obs;

  HomeController() {
    _personRepository = PersonRepository();
    scrollController = ScrollController();
  }

   @override
  void onClose() {
    scrollController.dispose();
  }
  
  @override
  void onInit() {
    initConnectivity();
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
    getProfiles();
    initScrollController();
    getPopular();
    super.onInit();
  }

   void initScrollController() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
        loading.isFalse) {
        getPopular();
      }
    });
  }

  void getPopular() async {
    if( offline.isFalse ) {
    try {
    pages.value == 1 ? loading.value = true : secondaryLoading.value = true;   
    pop.Response _response = await _personRepository.getAll(pages.value);
    pages.value = _response.page! + 1;
    _response.results!.map((result) => people.add(result)).toList();
     loading.value = false;
     secondaryLoading.value = false;   
     saveOffLine();
    } catch(e) {
      debugPrint('Error');
    }
    loading.value = false;
    secondaryLoading.value = false; 
    }  
  }

  saveOffLine() async {

    List<Results> _results = await  Get.find<DbHelper>().getResultsList();

    for (var person in people) {
      _results.firstWhere((element) => element.profilePath == person.profilePath, orElse: () {
        Get.find<DbHelper>().insertResults(person);
        return person;
      });
     }
  }

  String imageUrl (int index ) {
    try {
        return imagePath + people[index].profilePath!;
    }catch(e){
        return '';
    }
  }

  String profileUrl (int index ) => imagePath + images[index].filePath!;

  getProfiles() async => images.value = await Get.find<DbHelper>().getProfileList();

  updateSavedData() async {
    List<Results> _results = await  Get.find<DbHelper>().getResultsList();

    people.addAll(_results);
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    late ConnectivityResult result;

    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      return;
    }

    return _updateConnectionStatus(result);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    if(result == ConnectivityResult.none)
    {

      offline.value = true;

      people.isEmpty ? updateSavedData() : {};

      Get.showSnackbar(UI.errorSnackBar(message: 'No Internet Connection'));

    } else {
      if(offline.isTrue) {
        people.clear();
        pages.value = 1;
        getProfiles();
      }

      offline.value = false;


    }
  }
}