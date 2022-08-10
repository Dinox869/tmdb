import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/details/controller/details.controller.dart';
import 'package:tmdb/common/constants.dart';

class Details extends GetView<DetailsController>{
  const Details({Key? key}) : super(key: key);

final double _sigmaX = 0.0; // from 0-10
final double _sigmaY = 0.0; // from 0-10
final double _opacity = 0.6; // from 0-1.0

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(int.parse(controller.color.value)),
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Color(int.parse(controller.color.value)).withOpacity(0.6),
        title: Text('BACK', style: Get.textTheme.caption?.copyWith(color: Constants.white),),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 450,
              width: double.infinity,
              child: Stack(children: [
                Positioned.fill(
                  child: Image.asset('assets/test.png', fit: BoxFit.fill,)
                  ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text('Mercy', style: Get.textTheme.headline1?.copyWith(color: Constants.white)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                              child: Container(
                                color: Color(int.parse(controller.color.value)).withOpacity(0.4),
                                height: 100,
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('AGE', style: Get.textTheme.caption?.copyWith(color: Constants.white), textAlign: TextAlign.start,),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('12', style: Get.textTheme.caption?.copyWith(color: Constants.white, fontSize: 25), textAlign: TextAlign.end,),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                              child: Container(
                                color: Color(int.parse(controller.color.value)).withOpacity(0.4),
                                height: 100,
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('AGE', style: Get.textTheme.caption?.copyWith(color: Constants.white), textAlign: TextAlign.start,),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('12', style: Get.textTheme.caption?.copyWith(color: Constants.white, fontSize: 25), textAlign: TextAlign.end,),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),

                         ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                              child: Container(
                                color: Color(int.parse(controller.color.value)).withOpacity(0.4),
                                height: 100,
                                width: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text('AGE', style: Get.textTheme.caption?.copyWith(color: Constants.white), textAlign: TextAlign.start,),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text('12', style: Get.textTheme.caption?.copyWith(color: Constants.white, fontSize: 25), textAlign: TextAlign.end,),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          ],
                        )
                      ],
                    ),
                  )
                  )  
              ],),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(int.parse(controller.color.value)).withOpacity(0.5)
                ),
                height: 50,
                child: Center(child: Text('This is Ronaldo and he is not the only player ', style: Get.textTheme.headline6?.copyWith(color: Constants.white)))),
            ), 
            Container(
              height: 50,
              child: ListView.builder(itemBuilder: (_, index){
                return Container(height: 20,
                color: Colors.blue,
                );
              }),
            )

          ],
        )
        )
    );
  }

}