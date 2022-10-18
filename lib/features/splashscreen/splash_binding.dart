import 'package:algostudio/features/splashscreen/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}