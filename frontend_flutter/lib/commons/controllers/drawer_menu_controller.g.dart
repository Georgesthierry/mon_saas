// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drawer_menu_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(DrawerMenuController)
final drawerMenuControllerProvider = DrawerMenuControllerProvider._();

final class DrawerMenuControllerProvider
    extends $AsyncNotifierProvider<DrawerMenuController, bool> {
  DrawerMenuControllerProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'drawerMenuControllerProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$drawerMenuControllerHash();

  @$internal
  @override
  DrawerMenuController create() => DrawerMenuController();
}

String _$drawerMenuControllerHash() =>
    r'c0d70343c26b06b94fa256375c7fd62ed873e644';

abstract class _$DrawerMenuController extends $AsyncNotifier<bool> {
  FutureOr<bool> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<bool>, bool>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<AsyncValue<bool>, bool>,
        AsyncValue<bool>,
        Object?,
        Object?>;
    element.handleCreate(ref, build);
  }
}
