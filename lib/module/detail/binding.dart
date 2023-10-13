import 'package:get/get.dart';

import 'controller.dart';

class DetailBinding implements Bindings {
  final userId = Get.arguments as int?;
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}


