import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/details/controller/details.controller.dart';
import 'package:tmdb/app/modules/home/widget/load.tiles.dart';
import 'package:tmdb/app/routes/routes.dart';

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
        iconTheme: IconThemeData(color: controller.getFontColorForBackground()),
        backgroundColor: Color(int.parse(controller.color.value)).withOpacity(0.6),
        title: Text('BACK', style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground()),),
        
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 450,
              width: double.infinity,
              child: Stack(children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                                imageUrl: controller.imageUrl(),
                                fit: BoxFit.fill,
                                placeholder: (context, url) => const LoadContainer(),
                                errorWidget: (context, url, error) => const LoadContainer(),
                            ),
                  ),
                Positioned(
                  bottom: 5,
                  child: Container(
                    color: Colors.transparent,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(controller.person.value.name!, style: Get.textTheme.headline1?.copyWith(color: controller.getFontColorForBackground())),
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
                                          Text('GENDER', style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground()), textAlign: TextAlign.start,),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Text(controller.person.value.gender == 2 ? 
                                          'MALE' : 'FEMALE', style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground(), fontSize: 22), textAlign: TextAlign.end,),
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
                                          Text('POPULARITY', style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground()), textAlign: TextAlign.start,),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Flexible(child: Text(controller.person.value.popularity.toString(), style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground(), fontSize: 22),overflow: TextOverflow.ellipsis, textAlign: TextAlign.end,)),
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
                                          Text('KNOWN FOR', style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground()), textAlign: TextAlign.start,),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Flexible(
                                            child: Text(controller.person.value.knownForDepartment!, style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground(), fontSize: 22),
                                             textAlign: TextAlign.end,
                                             overflow: TextOverflow.fade,
                                             ),
                                          ),
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
            
            Obx(
              () => controller.loading.isFalse? Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if(controller.details.value.biography != "" )
                    Text('BioGraphy :\n${controller.details.value.biography}', style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground(), fontSize: 15)),
                    const SizedBox(height: 10,),
                    if(controller.details.value.placeOfBirth != "" )
                    Text('Place of Birth : ${controller.details.value.placeOfBirth}', style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground(), fontSize: 15)),
                    const SizedBox(height: 5,),
                    if(controller.details.value.birthday != "" )
                    Text('Birthday : ${controller.details.value.birthday}', style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground(), fontSize: 15)),
                    const SizedBox(height: 5,),
                    Text('\nOther images', style: Get.textTheme.caption?.copyWith(color: controller.getFontColorForBackground()) ),
                    const SizedBox(height: 10),
                  ],
                ),
              ) : const SizedBox(),
            ), 
            
            Obx(
              () =>controller.loading.isFalse ?  Container(
                height: 210,
                color: Color(int.parse(controller.color.value)).withOpacity(0.5),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.image.value.profiles?.length,
                  itemBuilder: (_, index){
                  return GestureDetector(
                    onTap: () => Get.toNamed(Routes.VIEW, arguments: {
                      'personUrl' : controller.profileUrl(index)
                    }),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 200,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20)
                        ),
                          child: CachedNetworkImage(
                                  imageUrl: controller.profileUrl(index),
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => const LoadContainer(small: true,),
                                  errorWidget: (context, url, error) => const LoadContainer(small: true,),
                              ),
                      ),
                    ),
                  );
                }),
              ) : const SizedBox()
            ),
            const SizedBox(height: 40)
          ],
        )
        )
    );
  }

}