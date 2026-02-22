import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/app_routes.dart';
import 'package:yenlei_flutter/commons/controllers/app_local_controller.dart';
import 'package:yenlei_flutter/commons/controllers/app_theme_controller.dart';
import 'package:yenlei_flutter/commons/style/app_theme.dart';
import 'package:yenlei_flutter/l10n/app_localizations.dart';
import 'package:yenlei_flutter/src/home/home_screen.dart';

void main() {
  runApp(
      ProviderScope(child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final localeAsync = ref.watch(appLocalControllerProvider);
    final themeAsync = ref.watch(appThemeControllerProvider);

    final localeCode = localeAsync.value ?? 'fr';

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'yenlei',

      locale: Locale(localeCode),
      supportedLocales: const [
        Locale('en'),
        Locale('fr'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      /// 🎨 Theme
      theme: AppTheme(fontFamily: _fontFamily(localeCode)).light,
      darkTheme: AppTheme(fontFamily: _fontFamily(localeCode)).dark,
      themeMode: themeAsync.value ?? ThemeMode.light,

      routerConfig:AppRoute.router,
    );
  }

  static String _fontFamily(String locale) {
    return locale == 'fr' ? 'Roboto' : 'Roboto';
  }
}