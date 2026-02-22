import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/app_routes.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';

class AppMenuList {

  static List<AppMenu> getItems(BuildContext context){
    
    return [
      AppMenu(title: context.texts.accueil, path: Routes.acceuil),
      AppMenu(title: context.texts.apropos, path: Routes.propos),
      AppMenu(title: context.texts.projets, path: Routes.projets),
      AppMenu(title: context.texts.contact, path: Routes.contact),
    ];

  }
}

class AppMenu {

  final String title;
  final String path;

  AppMenu({
    required this.title, required this.path});
}