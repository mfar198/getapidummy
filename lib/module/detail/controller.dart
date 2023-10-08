import 'package:get/get.dart';
import 'package:getapidummy/routing/routing.dart';

import '../list/controller.dart';

import '../../service/service.dart';
import '../../model/model.dart';

/**class DetailController extends GetxController {
  final int userId;
  final RxList<ListModel> userList = <ListModel>[].obs;

  DetailController({required this.userId});

  ListModel? getUserById(int userId) {
    return userList.firstWhere((user) => user.id == userId);
  }
}**/

class DetailController extends GetxController {
  //final int userId;
  late ListModel listModel;
  final RxList<ListModel> userList = <ListModel>[].obs;

  final userId = Get.arguments as int;

  //DetailController({required this.userId});

  @override
  void onInit() {
    super.onInit();
    final userId = Get.arguments as int;
    getUserById(userId);
    // Fetch the user list if it hasn't been fetched yet.
    if (userList.isEmpty) {
      fetchUserList();
      
    }
  }

  // Fetch the user list
  Future<void> fetchUserList() async {
    final response = await ApiService.getUserList();
    final List<dynamic> userData = response['data'];
    userList.assignAll(userData.map((data) => ListModel.fromJson(data)));
  }

  Future<void> getUserById(int userId) async {
    final response = await ApiService.getUserById(userId);
    final userData = response['data'];

    if (userData != null) {
      final userModel = ListModel.fromJson(userData);
      
      userList.clear();
      userList.add(userModel);
    }
  }

  void goToList() {
    Get.offNamed(AppLinks.list);
  }
}