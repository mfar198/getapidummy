import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/theme/theme_provider.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          child: const Icon(Icons.dark_mode_rounded, size: 25,),
          onTap: (){
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          }
        )
      ],
    );
  }
}