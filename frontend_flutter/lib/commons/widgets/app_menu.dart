import 'package:flutter/cupertino.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/l10n/app_localizations.dart';

class AppMenu extends StatelessWidget {
  const AppMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(context.texts.acceuil),
        Text(context.texts.propos),
        Text(context.texts.projets),
        Text(context.texts.services),
        Text(context.texts.contact),
      ],
    );
  }
}
