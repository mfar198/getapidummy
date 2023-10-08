import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getapidummy/constant/color.dart';

import '../../model/model.dart';
import 'controller.dart';

import '../../widget/mainwrap.dart';

class DetailView extends GetView<DetailController> {
  const DetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainWrap(
      padding: EdgeInsets.zero,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 280.h,
            child: Image.network(
              'https://4kwallpapers.com/images/wallpapers/scenery-landscape-mountains-lake-evening-reflections-scenic-2048x1536-8821.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(padding: const EdgeInsets.only(left: 16, top: 40),
            child: Row(
              children: [
                IconButton(onPressed: controller.goToList, icon: const Icon(Icons.arrow_back_ios,color: Colors.white,))
              ],
            ),),
          ),
          _buildScrollableContent(),
        ],
      ),
    );
  }

  Widget _buildScrollableContent() {
  return DraggableScrollableSheet(
    initialChildSize: 0.7,
    maxChildSize: 1.0,
    minChildSize: 0.7,
    builder: (context, scrollController) {
      return Container(
        padding: const EdgeInsets.all(25),
        clipBehavior: Clip.hardEdge,
        decoration: const BoxDecoration(
          color: color1,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: SingleChildScrollView(
          controller: scrollController,
          child: Obx(() {
            final userList = controller.userList;
            if (userList.isEmpty) {
              return const Center(
                child: Text('No users available.',style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.bold),),
              );
            } else {
              final user = userList[0]; // Assuming you want to display the first user
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 50,),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.avatar),
                  ),
                  const SizedBox(height: 20,),
                  Text('Name: ${user.firstName} ${user.lastName}',style: const TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  Text('Email: ${user.email}', style: const TextStyle(fontSize: 14, color: Colors.white,fontWeight: FontWeight.bold),),
                
                ],
              );
            }
          }),
        ),
      );
    },
  );
}
}