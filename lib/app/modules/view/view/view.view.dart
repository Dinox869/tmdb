import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/app/modules/details/controller/details.controller.dart';
import 'package:tmdb/app/modules/home/widget/load.tiles.dart';
import 'package:tmdb/app/modules/view/controller/view.controller.dart';

class View extends GetView<ViewController> {
  const View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(
      iconTheme: IconThemeData(color: controller.getFontColorForBackground()),
      backgroundColor: Color(int.parse(Get.find<DetailsController>().color.value)),
      actions: [
        IconButton(onPressed: (){
        },
        icon: const Icon(Icons.save))
      ],
    ),
    body:  CachedNetworkImage(
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
                                imageUrl: controller.personUrl.value,
                                fit: BoxFit.fill,
                                placeholder: (context, url) => const LoadContainer(),
                                errorWidget: (context, url, error) => const LoadContainer(),
                            ),
   );
  }

}