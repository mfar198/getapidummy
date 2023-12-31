import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routing/routing.dart';

import '../auth/controller.dart';

class RegisterController extends GetxController {
  final AuthController authController = Get.find();
  
  //Adding controller for email by automatically input the email to the textfield
  final TextEditingController emailController = TextEditingController(text: 'eve.holt@reqres.in');
  //Adding controller for password by automatically input the password to the textfield
  final TextEditingController passwordController = TextEditingController(text: 'cityslicka');

  void goToLogin() {
    Get.offNamed(AppLinks.login);
  }
}