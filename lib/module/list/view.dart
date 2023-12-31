import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../widget/widget.dart';

import '../auth/controller.dart';

import 'controller.dart';

class ListsView extends GetView<ListController>{
  const ListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainWrap(
      backgroundColor: Theme.of(context).colorScheme.background,
      padding: EdgeInsets.zero,
      appBar:  const MyAppBar(title: Text('List User')),
      showLogoutButton: true,
      onLogoutPressed: () => AuthController(),
      body: Obx(() {
        if(controller.userList.isEmpty){
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: controller.userList.length,
          itemBuilder: (context, index) {
            final user = controller.userList[index];
            return GestureDetector(
              onTap: () async {
                controller.goToDetails(user.id);
              },
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(user.avatar),
                ),
                title: Text('${user.firstName} ${user.lastName}'),
                subtitle: Text(user.email),
              ),
            );
          }
        );
      }),
    );
  }
}