import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:yenlei_flutter/commons/shared/app_shared_pref.dart';
part 'app_theme_controller.g.dart';

@riverpod
class AppThemeController  extends _$AppThemeController{

  Future<ThemeMode> build(){
    return AppSharedPref.getAppTheme();
  }

  void changeTheme(ThemeMode theme) async{
    await AppSharedPref.setAppTheme(theme == ThemeMode.dark ?'dark':'light');
    update((state)=>theme);
  }

}