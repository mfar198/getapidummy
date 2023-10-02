import 'package:get/get.dart';
import 'package:getapidummy/routing/routing.dart';

import '../list/controller.dart';

import 'controller.dart';

/**class DetailBinding implements Bindings {
  @override
  void dependencies() {
    final userId = Get.parameters['userId'];
    if (userId != null) {
      Get.put(DetailController(userId: int.parse(userId)));
    }
  }
}**/

/**class DetailBinding implements Bindings {
  @override
  void dependencies() {
    final userId = Get.arguments as int;
    if (userId != null) {
      Get.put(DetailController(userId: userId));
      print('User id is: $userId');
    } else {
      print('User id is null');
      Get.toNamed(AppLinks.list);
      Get.snackbar('Error', 'Id not found');
    }
  }
}**/

class DetailBinding implements Bindings {
  final userId = Get.arguments as int?;
  @override
  void dependencies() {
    Get.lazyPut(() => DetailController());
  }
}


