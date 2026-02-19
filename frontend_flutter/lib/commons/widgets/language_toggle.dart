import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/app_icon.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/controllers/app_local_controller.dart';
import 'package:yenlei_flutter/commons/widgets/popup_language_switch_item.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';

class LanguageToggle extends ConsumerWidget {
  const LanguageToggle({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final locale = ref.watch(appLocalControllerProvider);
    return PopupMenuButton(itemBuilder: (context){
      return[
        PopupMenuItem(
          value: 0,
            child: PopupLanguageSwitchItem(language: 'Anglais', icon: AppIcon.us)),
        PopupMenuItem(
          value: 1,
            child: PopupLanguageSwitchItem(language: 'Français', icon: AppIcon.fr)),
      ];
    },
      initialValue: locale.value == 'fr'? 0 : 1,
      onSelected: (int value){
      if (value == 0){
        ref.read(appLocalControllerProvider.notifier).changeLocale('en');
      }else{
        ref.read(appLocalControllerProvider.notifier).changeLocale('fr');
      }
      },
    child: Row(
        children: [
          Icon(Icons.language,color: context.colorScheme.onBackground),
          SizedBox(width: 4,),
          SEOText(locale.value == 'en' ? 'En':'fr')
        ],
    ),
    );
  }
}

