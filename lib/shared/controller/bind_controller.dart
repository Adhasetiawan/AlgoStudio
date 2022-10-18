import 'package:get/get.dart';
import '../../features/splashscreen/splash_controller.dart';

class BindController extends Bindings{
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}