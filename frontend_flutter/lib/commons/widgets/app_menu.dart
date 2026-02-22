import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:yenlei_flutter/commons/constantes/app_menu_list.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/large_app_bar_menu_item.dart';
import 'package:yenlei_flutter/l10n/app_localizations.dart';

class LargeMenu extends StatelessWidget {
  const LargeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: AppMenuList.getItems(context).map((e) =>LargeAppBarMenuItem(text: e.title, isSelected: GoRouterState.of(context).fullPath == e.path, onTap: () {
        context.go(e.path);
      },)).toList()
    );
  }
}
