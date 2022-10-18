import 'package:algostudio/features/home/home_controller.dart';
import 'package:algostudio/page/app_routes.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class HomePage extends GetView<HomeController>{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => RefreshIndicator(
        onRefresh: ()async{
          await Future.delayed(const Duration(seconds: 3));
          controller.getImages();
        },
        child: SizedBox(
          width: Get.width,
          height: Get.height,
          child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 120,
                childAspectRatio: 2 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: controller.images.length,
              itemBuilder: (context, index)=> GestureDetector(
                onTap: ()=> Get.toNamed(Routes.detail, arguments: controller.images[index].url!),
                child: Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: controller.images[index].url!,
                    progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer.fromColors(
                        baseColor: Colors.grey[300]!,
                        highlightColor: Colors.grey[100]!,
                        child: Container(
                            color: Colors.white
                        )
                    ),
                    errorWidget: (context, url, error)=> Container(
                      color: Colors.grey.withOpacity(0.3),
                      height: 80,
                      width: 80,
                      child: const Icon(Icons.image),
                    ),
                  ),
                ),
              )
          ),
        ),
      )),
    );
  }
}