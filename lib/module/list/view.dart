import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:getapidummy/routing/routing.dart';

import '../../widget/widget.dart';
import 'controller.dart';

class ListsView extends GetView<ListController>{
  const ListsView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainWrap(
      padding: const EdgeInsets.all(16),
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
                print(user.id);
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