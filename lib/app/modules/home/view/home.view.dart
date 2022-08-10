import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tmdb/app/modules/home/controller/home.controller.dart';
import 'package:tmdb/app/routes/routes.dart';
import 'package:tmdb/common/constants.dart';

class HomeView extends GetView<HomeController>{
  
  const HomeView({Key? key}) : super(key: key);

final double _sigmaX = 0.0; // from 0-10
final double _sigmaY = 0.0; // from 0-10
final double _opacity = 0.6; // from 0-1.0
final double _width = 200;
final double _height = 20;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.white,
        centerTitle: false,
        title: Text('Popular People', style: Get.textTheme.headline6),
      ),
      body: SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 100,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          primary: false,
          itemBuilder: ((_,index) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                  onTap: () async{
                    var paletteGenerator = await PaletteGenerator.fromImageProvider(
                              Image.asset('assets/test.png').image,
                            );
                            Color color = paletteGenerator.dominantColor!.color;
                            print('$color');
                      Get.toNamed(Routes.DETAILS, arguments: {
                        'color' : color.value.toString()
                      });
                  },
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Stack(
                      children: [
                        Positioned.fill(
                          child: Image.asset('assets/test.png', fit: BoxFit.fill,),
                              ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child:  ClipRect(
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                              child: Container(
                                color:  Colors.black.withOpacity(_opacity),
                                child: Center(child: Text('Helping scounts', style: Get.textTheme.headline6?.copyWith(color: Constants.white))),
                              ),
                            ),
                          ),)      
                      ],
                    )
                  ),
                ),
              ),
            );
          })
          )
      ),
    );
  }

}