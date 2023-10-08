import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget title;
  final List<Widget> actions;

  const CustomAppBar({super.key, 
    required this.title,
    required this.actions,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      actions: actions,
      leading: Padding(
        padding: const EdgeInsets.only(left: 16, right: 5, top: 5, bottom: 5),
        child: Image.asset('assets/image/logo.png',fit: BoxFit.contain, width: 15.w, height: 15.h,)),
    );
  }
}

class MainWrap extends StatelessWidget {

  final Widget body;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;
  final CustomAppBar? appBar;
  final bool showLogoutButton;
  final Function()? onLogoutPressed;

  const MainWrap({
    super.key,
    required this.body,
    this.padding,
    this.backgroundColor = Colors.white,
    this.appBar,
    this.showLogoutButton = false,
    this.onLogoutPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      backgroundColor: backgroundColor,
      body: Padding(
        padding: padding ?? const EdgeInsets.all(0),
        child: Column(
          children: <Widget>[
            appBar != null ? appBar! : const SizedBox(height: 0),
            Expanded(child: body),
          ],
        ),
      ),
    );
  }
}