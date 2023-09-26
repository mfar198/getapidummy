import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../routing/routing.dart';
import '../../service/service.dart';

class AuthController extends GetxController {
  var isLoggedIn = false.obs;
  final storage = const FlutterSecureStorage();

  @override
  void onInit() {
    super.onInit();
    init();
  }

  Future<void> init() async {
    final token = await storage.read(key: 'token');
    if(token != null) {
      isLoggedIn.value = true;
      Get.offNamed(AppLinks.list);
    } else {
      Get.offNamed(AppLinks.login);
    }
  }

  Future<void> login(String email, String password) async {
    final response = await ApiService.loginUser(email, password);
    if (response.containsKey('token')) {
      await storage.write(
          key: 'token', value: response['token']); // Store token securely
      isLoggedIn.value = true;
      await Get.offNamed(AppLinks.list);
    } else {
      // Account not found, show error message
      Get.snackbar(
        'Login Failed',
        'Email or password does not exist',
        backgroundColor: Colors.black,
        colorText: Colors.white,
      );
    }
  }

  Future<void> register(String email, String password) async {
    final response = await ApiService.registerUser(email, password);
    if (response.containsKey('token')) {
      await storage.write(
          key: 'token', value: response['token']); // Store token securely
      isLoggedIn.value = true;
      await Get.offNamed(AppLinks.login);
    }
  }

  /**Future<void> checkLoginStatus() async {
    final token = await storage.read(key: 'token'); // Read token from storage
    if (token != null){
      isLoggedIn.value = true;
    } else {
      await Get.toNamed(AppLinks.login);
    }
    //isLoggedIn.value = token != null;
  }**/

  void logout() async {
    await storage.delete(key: 'token'); // Remove token from storage
    isLoggedIn.value = false;
  }
}