import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../theme/theme_button.dart';
import '../../widget/mainwrap.dart';
import '../../constant/constant.dart';

import 'controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return MainWrap(
      backgroundColor: Theme.of(context).colorScheme.background,
      padding: const EdgeInsets.all(16),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 20,),
          const ThemeButton(),
          const SizedBox(height: 40,),
          Image.asset(
              isDarkMode
                  ? 'assets/image/logo.png'
                  : 'assets/image/logo-dark.png',
              fit: BoxFit.contain,
              width: 200,
              height: 110,
            ),
          const SizedBox(height: 30,),
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
              backgroundColor: color1,
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
            child: const Text('Login', style: TextStyle(color: Colors.white),),
          ),
            ),
            const SizedBox(height: 15,),
          GestureDetector(
          onTap: () async {
            controller.goToRegister();
          },
          child: const Text('Create an account here', style: TextStyle(fontSize: 14,),) ,
            ),
        ],
      ),
    );
  }
}