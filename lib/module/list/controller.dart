import 'package:get/get.dart';
import 'package:getapidummy/routing/routing.dart';

import '../../service/service.dart';
import '../../model/model.dart';

class ListController extends GetxController {
  final RxList<ListModel> userList = <ListModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLists();
  }

  Future<void>fetchLists() async {
    final response = await ApiService.getUserList();
    final List<dynamic>userData = response['data'];
    userList.assignAll(userData.map((data) => ListModel.fromJson(data)));
  }

  ListModel getUserById(int userId){
    return userList.firstWhere((user) => user.id == userId,);
  }

  Future<void> goToDetails(int userId) async {
    await Get.toNamed(AppLinks.detail, arguments: userId);
  }
}