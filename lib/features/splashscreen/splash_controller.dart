import 'package:algostudio/page/app_routes.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{

  @override
  void onInit() async {
    splashAnimation();
    super.onInit();
  }

  splashAnimation() async {
    await Future.delayed(const Duration(seconds: 3));
    Get.offNamed(Routes.home);
  }
}