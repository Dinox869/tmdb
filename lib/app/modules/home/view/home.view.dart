import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/home/controller/home.controller.dart';
import 'package:tmdb/common/constants.dart';

class HomeView extends GetView<HomeController>{
  
  const HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.white,
        centerTitle: false,
        title: Text('Popular People', style: TextStyle(),),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
        ),
      ),
    );
  }

}