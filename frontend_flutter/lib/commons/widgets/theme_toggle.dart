import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/controllers/app_theme_controller.dart';

class ThemeToggle extends ConsumerWidget {
  const ThemeToggle({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final state = ref.watch(appThemeControllerProvider);
    final isDark = state.value ?? ThemeMode.system;
    return Switch(
        value: isDark  == ThemeMode.dark,
        onChanged: (value){
      ref.read(appThemeControllerProvider.notifier).changeTheme(value ? ThemeMode.dark:ThemeMode.light);
    });
  }
}
