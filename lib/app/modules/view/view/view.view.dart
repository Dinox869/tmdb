import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/view/controller/view.controller.dart';

class View extends GetView<ViewController> {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SingleChildScrollView(
      child: Container(
        color: Colors.blue,
      )),
   );
  }

}