import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/model/image.model.dart' as model;
import 'package:tmdb/app/model/person.model.dart';
import 'package:tmdb/app/model/results.model.dart';
import 'package:tmdb/app/repository/person.repository.dart';
import 'package:tmdb/common/ui.dart';

class DetailsController extends GetxController{
  final color = ''.obs;
  final person = Results().obs;
  final details = Person().obs;
  final image = model.Image().obs;
  final loading = true.obs;
  final imagePath = 'https://image.tmdb.org/t/p/original'.obs;
  late PersonRepository _personRepository;

  DetailsController() {
    _personRepository = PersonRepository();
  }

  @override
  void onInit() {
    //Get passed variables
    var arguments = Get.arguments as Map<String, dynamic>;
    color.value = arguments['color'];
    person.value = arguments['person'];
    //Fetch individual person data
    getDetails();
    super.onInit();
  }

  getDetails() async {
    try{
    loading.value = true;  
    Person _person = await _personRepository.getPerson(person.value.id!);
    model.Image _image = await _personRepository.getImages(person.value.id!);
    details.value = _person;
    image.value = _image;
    loading.value = false;
    }catch(e)
    {
      Get.showSnackbar(UI.errorSnackBar(message: '$e'));
    }
    
  }

String imageUrl () => imagePath + person.value.profilePath!;

String profileUrl(int index) => imagePath + image.value.profiles![index].filePath!;

//Determine the text color 
Color getFontColorForBackground() {
  return (Color(int.parse(color.value)).computeLuminance() > 0.179)? Colors.black : Colors.white;
} 
}