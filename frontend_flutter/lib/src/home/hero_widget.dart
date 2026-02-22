import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/style/app_size.dart';
import 'package:yenlei_flutter/src/home/hero_buttons.dart';
import 'package:yenlei_flutter/src/home/hero_image.dart';
import 'package:yenlei_flutter/src/home/hero_texts.dart';
import 'package:yenlei_flutter/src/powered_by_flutter/power_by_flutter.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PowerByFlutter(),
        context.isDesktop || context.isTablet ? const _LargeHero():const  _SmallHero()
      ],
    );
  }
}

class _SmallHero extends StatelessWidget {
  const _SmallHero();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
            constraints: BoxConstraints(
                maxWidth: 140),
          child: HeroImage(),
        ),
        SizedBox(width: Insets.xl,),
        HeroTexts(),
        SizedBox(height: Insets.xl,),
        SmallHeroButtons()
      ],
    );
  }
}

class _LargeHero extends StatelessWidget {
  const _LargeHero();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Insets.xl,),
        Expanded(child: HeroImage()),
        SizedBox(width: Insets.xl,),
        Expanded(
          flex: 2,
            child: Column(
          children: [
            HeroTexts(),
            SizedBox(height: Insets.xl,),
            LargeHeroButtons(),
          ],
        ))
      ],
    );
  }
}


