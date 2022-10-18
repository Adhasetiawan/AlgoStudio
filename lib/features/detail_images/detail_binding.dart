import 'package:algostudio/features/detail_images/detail_controller.dart';
import 'package:get/get.dart';

class DetailBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<DetailController>(() => DetailController());
  }
}