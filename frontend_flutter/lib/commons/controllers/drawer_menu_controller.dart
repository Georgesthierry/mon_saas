import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'drawer_menu_controller.g.dart';

@riverpod
class DrawerMenuController extends _$DrawerMenuController {
  @override
  FutureOr<bool> build() {
    return false;
  }
  open(){
    update((state)=> true);
  }
  close(){
    update((state)=> false);
  }
}
