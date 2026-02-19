import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    final locale = ref.watch(appLocalControllerProvider);
    final theme = ref.watch(appThemeControllerProvider);
    return MaterialApp(
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: [
        Locale('en'),
        Locale('fr'),
      ],
      locale: Locale(locale.value ?? 'fr'),
      darkTheme: AppTheme(fontFamily: _fontFamily(locale.value)).dark,
      theme: AppTheme(fontFamily: _fontFamily(locale.value)).light,
      themeMode: theme.value,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: HomeScreen(),
    );
  }
  String _fontFamily(String? locale){
    return (locale ?? 'fr')=='fr'? 'Roboto':'Roboto';
  }
}
