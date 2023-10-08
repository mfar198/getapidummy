import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'mainwrap.dart';

import '../module/auth/controller.dart';

class MyAppBar extends CustomAppBar {
  
  const MyAppBar({
    Key? key,
    Widget? title,
    }) : super(key: key, title: title);

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: title,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: (){
            Get.find<AuthController>().logout();
          },
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, right: 5, top: 5, bottom: 5),
        child: Image.asset('assets/image/logo.png',fit: BoxFit.contain, width: 15.w, height: 15.h,)),
    );
  }
}