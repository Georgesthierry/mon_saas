import 'package:flutter/material.dart';

class LanguageToggle extends StatelessWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (context){
      return[
        PopupMenuItem(child: Text('English')),
        PopupMenuItem(child: Text('Français')),
      ];
    }
    );
  }
}
