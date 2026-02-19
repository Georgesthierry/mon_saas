// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_local_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AppLocalController)
final appLocalControllerProvider = AppLocalControllerProvider._();

final class AppLocalControllerProvider
    extends $AsyncNotifierProvider<AppLocalController, String> {
  AppLocalControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appLocalControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appLocalControllerHash();

  @$internal
  @override
  AppLocalController create() => AppLocalController();
}

String _$appLocalControllerHash() =>
    r'3f1985e5cb02af4b9e3e308685e1f7670c5cd436';

abstract class _$AppLocalController extends $AsyncNotifier<String> {
  FutureOr<String> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<String>, String>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<String>, String>,
        AsyncValue<String>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
