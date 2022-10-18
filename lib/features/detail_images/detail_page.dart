import 'dart:io';

import 'package:algostudio/features/detail_images/detail_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class DetailPage extends GetView<DetailController>{
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        foregroundColor: Colors.black.withOpacity(0.7),
        leading: IconButton(
            onPressed: ()=> Get.back(),
            icon: const Icon(Icons.chevron_left)),
        title: Text(
          'Detail meme',
          style: GoogleFonts.comicNeue(
            textStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            )
          ),
        ),
      ),
      body: Obx(() => Stack(
        children: <Widget>[
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(26),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26.withOpacity(0.4),
                            spreadRadius: 1,
                            blurRadius: 10,
                            offset: const Offset(0, 5)
                        )
                      ]
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(26),
                    child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: controller.img.value,
                      progressIndicatorBuilder: (context, url, downloadProgress) => Shimmer.fromColors(
                          baseColor: Colors.grey[300]!,
                          highlightColor: Colors.grey[100]!,
                          child: Container(
                              color: Colors.white
                          )
                      ),
                      errorWidget: (context, url, error) => Icon(
                          Icons.image,
                          size: 120,
                          color: Colors.grey.withOpacity(0.6)
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Visibility(
                  visible: controller.outputText.value != "" && controller.storageImg.value != "" ? false : true,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(16, 20, 20, 0),
                    child: Row(
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Add Logo',
                                style: GoogleFonts.comicNeue(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: ()=> controller.getImgGallery(),
                              child: Icon(
                                  Icons.image,
                                  size: 60,
                                  color: Colors.grey.withOpacity(0.6)
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text(
                                'Add Text',
                                style: GoogleFonts.comicNeue(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold
                                    )
                                ),
                              ),
                            ),
                            GestureDetector(
                                onTap: ()=> controller.addText(),
                                child: Icon(
                                    Icons.text_fields,
                                    size: 60,
                                    color: Colors.grey.withOpacity(0.6)
                                )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Visibility(
                  visible: controller.outputText.value != "" && controller.storageImg.value != "" ? true : false,
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(16, 20, 20, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                            padding: EdgeInsets.all(5),
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                fixedSize: Size(Get.width * 0.4, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)
                                )
                              ),
                              child: Text(
                                'Simpan'
                              )
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.all(5),
                          child: ElevatedButton(
                              onPressed: (){},
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                backgroundColor: Colors.transparent,
                                foregroundColor: Colors.blueAccent,
                                fixedSize: Size(Get.width * 0.4, 45),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  side: BorderSide(color: Colors.blueAccent)
                                )
                              ),
                              child: Text(
                                'Share'
                              )
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
            child: Container(
              margin: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: <Widget>[
                  Visibility(
                    visible: controller.storageImg.value != '' ? true : false,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image.file(
                        width: 90,
                        height: 90,
                        fit: BoxFit.cover,
                        File(controller.storageImg.value),
                      ) ,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Visibility(
                    visible: controller.outputText.isNotEmpty ? true : false,
                    child: Text(
                      controller.edtTxt.text,
                      style: GoogleFonts.comicNeue(
                          textStyle: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold
                          )
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}