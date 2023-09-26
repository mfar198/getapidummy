import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getapidummy/widget/mainwrap.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return MainWrap(
      padding: const EdgeInsets.all(16),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
            controller: controller.emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: const InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16,),
          TextField(
            controller: controller.passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20,),
          ElevatedButton(
            onPressed: () {
              String email = controller.emailController.text.trim();
              String password = controller.passwordController.text.trim();
    
              if(GetUtils.isEmail(email)){
                controller.authController.login(email,password);
              }else {
                Get.snackbar('Invalid Email', 'Please enter a valid email address');
              }
            },
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}