import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/model/response.model.dart' as pop;
import 'package:tmdb/app/model/results.model.dart';
import 'package:tmdb/app/repository/person.repository.dart';

class HomeController extends GetxController {
  final loading = true.obs;
  final secondaryLoading = false.obs;
  final pages = 1.obs;
  late PersonRepository _personRepository;
  final people = <Results>[];
  late ScrollController scrollController;
  final imagePath = 'https://image.tmdb.org/t/p/original'.obs;

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
    try{
    pages.value == 1 ? loading.value = true : secondaryLoading.value = true;   
    pop.Response _response = await _personRepository.getAll(pages.value);
    pages.value = _response.page! + 1;
    _response.results!.map((result) => people.add(result)).toList();
     loading.value = false;
     secondaryLoading.value = false;   
    }catch(e){
      print('Error ==> $e');
    }
    loading.value = false;
    secondaryLoading.value = false;   
  }

  String imageUrl (int index ) => imagePath + people[index].profilePath!;
  

}