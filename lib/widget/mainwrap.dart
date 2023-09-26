import 'package:flutter/material.dart';

class MainWrap extends StatelessWidget {

  final Widget body;
  final EdgeInsetsGeometry? padding;
  final Color backgroundColor;

  const MainWrap({
    super.key,
    required this.body,
    this.padding,
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: padding != null
      ? Padding
      (padding: padding!,
      child: body,
      )
      : body,
    );
  }
}
