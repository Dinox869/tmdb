import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/details/controller/details.controller.dart';
import 'package:tmdb/app/modules/view/controller/view.controller.dart';

class View extends GetView<ViewController> {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      backgroundColor: Color(int.parse(Get.find<DetailsController>().color.value)),
      actions: [
        IconButton(onPressed: (){

        },
        icon: const Icon(Icons.save))
      ],
    ),
    body: Image.asset('assets/test.png',
     fit: BoxFit.fill,
     height: MediaQuery.of(context).size.height,
     width: double.infinity,
     ),
   );
  }

}