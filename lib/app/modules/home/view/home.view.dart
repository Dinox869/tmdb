import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';
import 'package:tmdb/app/modules/home/controller/home.controller.dart';
import 'package:tmdb/app/modules/home/widget/load.tiles.dart';
import 'package:tmdb/app/routes/routes.dart';
import 'package:tmdb/common/constants.dart';

class HomeView extends GetView<HomeController>{
  
  const HomeView({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Constants.white,
        centerTitle: false,
        title: Text(
            'Popular People',
            key: const Key('appBar_Text'),
            style: Get.textTheme.headline6),
      ),
      body: Obx(
        ()=> SingleChildScrollView(
          controller: controller.scrollController,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            controller.images.isNotEmpty ? 
            Text('Saved Images', style: Get.textTheme.caption?.copyWith(fontSize: 15)) 
            : const SizedBox(),
            const SizedBox(height: 10,),
            controller.images.isNotEmpty ? 
             SizedBox(
                  height: 210,
                  child: ListView.builder (
                    scrollDirection: Axis.horizontal,
                    itemCount: controller.images.length,
                    itemBuilder: (_, index){
                    return GestureDetector(
                      onTap: () async {
                        if(controller.offline.isFalse){
                          var paletteGenerator = await PaletteGenerator.fromImageProvider(
                                  Image.network(controller.imageUrl(index)).image,
                                );
                          Color color = paletteGenerator.dominantColor!.color;
                        Get.toNamed(Routes.VIEW, arguments: {
                        'profile' : controller.images[index],
                        'color': color.value.toString()
                      });
                        }
                      }
                      ,
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
                    }
                  ),
                ): const SizedBox(),

            controller.loading.isTrue ? 
              const LoadTiles() :
             ListView.builder(
              key: const Key('ListView'),
              shrinkWrap: true,
              itemCount: controller.people.length + 1,
              primary: false,
              itemBuilder: ((_,index) {    
                return index > (controller.people.length -1 ) ?
                controller.secondaryLoading.isFalse?  const SizedBox() : SizedBox(
                  height: 50,
                  child:  CircularProgressIndicator(
                    color: Constants.black,
                  ),
                )
                 :  Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: GestureDetector(
                      key: Key('tap_$index'),
                      onTap: () async{
                         if(controller.offline.isFalse) {
                          var paletteGenerator = await PaletteGenerator.
                          fromImageProvider(Image.network(controller.imageUrl(index)).image);
                          Color color = paletteGenerator.dominantColor!.color;
                          Get.toNamed(Routes.DETAILS, arguments: {
                            'color' : color.value.toString(),
                            'person' : controller.people[index]
                          });
                         }
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
                              child: CachedNetworkImage(
                                  imageUrl: controller.imageUrl(index),
                                  fit: BoxFit.fill,
                                  placeholder: (context, url) => const LoadContainer(),
                                  errorWidget: (context, url, error) => const LoadContainer(),
                              ),
                              ),
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child:  ClipRect(
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(sigmaX: controller.sigmaX, sigmaY: controller.sigmaY),
                                  child: Container(
                                    color:  Colors.black.withOpacity(controller.opacity),
                                    child: Center(child: Text(
                                      controller.people[index].name!.toUpperCase(),
                                      style: Get.textTheme.headline6?.copyWith(color: Constants.white))),
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
              ],
            ),
          )
        ),
      ),
    );
  }

}