import 'package:algostudio/features/splashscreen/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class SplashPage extends GetView<SplashController>{
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Image.asset(
          'assets/images/main_logo.png',
          fit: BoxFit.fitHeight,
          height: 60,
        ),
      ),
    );
  }
}