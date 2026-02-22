import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yenlei_flutter/commons/constantes/app_menu_list.dart';
import 'package:yenlei_flutter/commons/widgets/large_app_bar_menu_item.dart';

class SmallMenu extends StatelessWidget {
  const SmallMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: AppMenuList.getItems(context).map((e) =>LargeAppBarMenuItem(text: e.title, isSelected: GoRouterState.of(context).fullPath == e.path, onTap: () {
          context.go(e.path);
        },)).toList()
    );
  }
}
