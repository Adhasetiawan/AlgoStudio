import 'package:algostudio/features/home/home_api.dart';
import 'package:algostudio/features/home/home_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class HomeBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(api: HomeApi()));
  }
}