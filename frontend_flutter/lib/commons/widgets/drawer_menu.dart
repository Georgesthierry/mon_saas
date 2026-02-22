import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/controllers/drawer_menu_controller.dart';
import 'package:yenlei_flutter/commons/widgets/small_menu.dart';



class DrawerMenu extends ConsumerStatefulWidget {
  const DrawerMenu({super.key});

  @override
  ConsumerState<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends ConsumerState<DrawerMenu>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    duration: Duration(milliseconds: 200),
    vsync: this,
  );
  late final _animation = Tween<Offset>(
    begin: Offset(0, -1),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(drawerMenuControllerProvider, (previous,next){
      if (next.value==true){
        _controller.forward();
      }else{
        _controller.reverse();
      }
    });
    return ClipRRect(
      child: SlideTransition(
        position: _animation,
        child: Container(
          width: double.infinity,
          decoration:
              BoxDecoration(color: context.colorScheme.surface, boxShadow: [
            BoxShadow(
                color: context.colorScheme.surface.withOpacity(0.4),
                blurRadius: 6,
                spreadRadius: 3)
          ]),
          child: SmallMenu(),
        ),
      ),
    );
  }
}

