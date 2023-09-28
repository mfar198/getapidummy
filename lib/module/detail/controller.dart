import 'package:get/get.dart';

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
    print('Current user Id on Init: $userId');
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

  // Get the user by ID with error handling
  /**ListModel? getUserById(int userId) {
    try {
      print('User id in the list model is $userId');
      return userList.firstWhereOrNull((user) => user.id == userId);
    } catch (e) {
      // Handle the case where the user is not found.
      print('User with ID $userId not found.');
      return null;
    }
  }**/

  Future<void> getUserById(int userId) async {
    final response = await ApiService.getUserById(userId);
    final userData = response['data'];

    if (userData != null) {
      final userModel = ListModel.fromJson(userData);
      
      userList.clear();
      userList.add(userModel);
    }
  }
}