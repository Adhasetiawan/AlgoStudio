import 'package:algostudio/features/detail_images/detail_page.dart';
import 'package:algostudio/features/home/home_binding.dart';
import 'package:algostudio/features/home/home_page.dart';
import 'package:get/get.dart';
import '../features/detail_images/detail_binding.dart';
import '../features/splashscreen/splash_binding.dart';
import '../features/splashscreen/splash_page.dart';
import 'app_routes.dart';

class AppPages{
  static final pages = [
    GetPage(
        name: Routes.INITIAL,
        page: ()=> const SplashPage(),
        binding: SplashBinding()
    ),
    GetPage(
        name: Routes.home ,
        page: ()=> const HomePage(),
        binding: HomeBinding()
    ),
    GetPage(
        name: Routes.detail ,
        page: ()=> const DetailPage(),
        binding: DetailBinding()
    ),
  ];
}