import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/style/app_size.dart';
import 'package:yenlei_flutter/commons/widgets/app_bar_drawer_icon.dart';
import 'package:yenlei_flutter/commons/widgets/app_logo.dart';
import 'package:yenlei_flutter/commons/widgets/app_menu.dart';
import 'package:yenlei_flutter/commons/widgets/language_toggle.dart';
import 'package:yenlei_flutter/commons/widgets/theme_toggle.dart';

import 'drawer_menu.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(microseconds: 200),
          padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
          height: context.insets.appBarHeight,
          color: context.theme.appBarTheme.backgroundColor,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: Insets.maxWidth
            ) ,
            child: Row(
              children: [
                AppLogo(),
                Spacer(),
                if (context.isDesktop)LargeMenu(),
                Spacer(),
                LanguageToggle(),
                ThemeToggle(),
                if (!context.isDesktop) AppBarDrawerIcon()
              ],
            ),
          ),
        ),
        if(!context.isDesktop) DrawerMenu()
      ],
    );
  }
}
