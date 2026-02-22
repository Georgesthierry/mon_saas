import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';import 'package:yenlei_flutter/commons/style/app_size.dart';import 'package:yenlei_flutter/commons/widgets/my_app_bar.dart';
import 'package:yenlei_flutter/src/footer/my_footer.dart';

import '../constantes/background_blur.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({super.key, required this.slivers});
  final List <Widget> slivers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            BackgroundBlur(),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                constraints: BoxConstraints(maxWidth: Insets.maxWidth),
                padding: EdgeInsets.only(top: context.insets.appBarHeight),
                child: CustomScrollView(
                  slivers: [
                    ...slivers,
                    SliverToBoxAdapter(
                      child: const MyFooter(),
                    )
                  ],
                ),
              ),
            ),
            const MyAppBar(),
          ],
        )
    );
  }
}
