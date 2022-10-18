import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DetailController extends GetxController{

  final ImagePicker picker = ImagePicker();

  TextEditingController edtTxt = TextEditingController();
  var outputText = ''.obs;
  var storageImg = ''.obs;
  var img = ''.obs;

  @override
  void onInit() {
    getImg();
    super.onInit();
  }


  @override
  void onClose() {
    edtTxt.dispose();
    super.onClose();
  }

  getImgGallery()async{
    final XFile? fileImg = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50
    );
    if(fileImg != null){
      storageImg.value = fileImg.path;
    }else{
      return;
    }
  }

  getImg(){
    img.value = Get.arguments;
  }

  addText(){
    return Get.defaultDialog(
      radius: 8,
      title: 'Add Text',
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: edtTxt,
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Type something here',
              border: InputBorder.none
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
              onPressed: (){
                outputText.value = edtTxt.text;
                Get.back();
              },
              child: const Text('Add')
          )
        ],
      )
    );
  }
}