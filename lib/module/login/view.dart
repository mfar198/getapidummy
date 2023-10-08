import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../widget/mainwrap.dart';
import '../../constant/constant.dart';

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
          Image.asset('assets/image/login-header.jpg',fit: BoxFit.contain, width: 350.w, height: 220.h,),
          const SizedBox(height: 10,),
          Container(
            alignment: Alignment.centerLeft,
            child: const Text('Login',style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900, color: color1), textAlign: TextAlign.start,)),
          const SizedBox(height: 15,),
          TextField(
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: const InputDecoration(
            hintText: 'Email',
            border: OutlineInputBorder(),
          ),
            ),
            const SizedBox(height: 16,),
            TextField(
          controller: controller.passwordController,
          obscureText: true,
          decoration: const InputDecoration(
            hintText: 'Password',
            border: OutlineInputBorder(),
          ),
            ),
            const SizedBox(height: 20,),
            SizedBox(
          width: double.infinity,
          height: 40.h,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: color1,
              shadowColor: Colors.grey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
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
          ),
            ),
            const SizedBox(height: 10,),
            GestureDetector(
          onTap: () async {
            controller.goToRegister();
          },
          child: const Text('Create an account here', style: TextStyle(fontSize: 14, color: Colors.black),) ,
            ),
        ],
      ),
    );
  }
}