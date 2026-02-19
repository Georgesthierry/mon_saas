import 'package:yenlei_flutter/commons/shared/app_shared_pref.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_local_controller.g.dart';

@riverpod
class AppLocalController extends _$AppLocalController {
  @override
  FutureOr<String> build() {
    return AppSharedPref.getAppLocale();
  }

  void changeLocale(String newLocale) async {
    await AppSharedPref.setAppLocale(newLocale);
    update((state) => newLocale);
  }
}
