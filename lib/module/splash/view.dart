import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widget/widget.dart';

import 'controller.dart';

class SplashView extends GetView<SplashController>{
  const SplashView({super.key});

  @override
  Widget build(BuildContext context){
    
    return GetBuilder(
      init: SplashController(),
      builder: (_) => const MainWrap(
        body: Center(
          child: CircularProgressIndicator(),
          )
        ),
    );
  }
}