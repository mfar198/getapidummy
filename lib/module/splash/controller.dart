import 'package:get/get.dart';

import '../auth/controller.dart';

class SplashController extends GetxController{
  final isLoggedIn = Get.find<AuthController>().isLoggedIn.value;

  @override
  void onInit() async {
    super.onInit();

    await Future.delayed(const Duration(seconds: 2));

    await Get.find<AuthController>().init();
  }
}