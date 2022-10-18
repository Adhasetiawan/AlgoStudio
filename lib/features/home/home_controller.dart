import 'dart:developer';

import 'package:algostudio/features/home/home_api.dart';
import 'package:algostudio/response/img_response.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
  final HomeApi api;
  HomeController({required this.api});

  var loading = false.obs;
  RxList<ImagesResponse> images = <ImagesResponse>[].obs;

  @override
  void onInit() {
    getImages();
    super.onInit();
  }

  getImages()async{
    try{
      loading(true);
      var listImagesResponse = await api.listImg();
      if(listImagesResponse["success"] == true){
        var imgs = listImagesResponse["data"]["memes"];
        images(RxList<ImagesResponse>.from(
          imgs.map((e)=> ImagesResponse.fromJson(e))
        ));
      }
      loading(false);
    }catch(e){
      loading(false);
      log(e.toString());
    }
  }
}