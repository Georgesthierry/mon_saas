import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/providers/profile_provider.dart';
import 'package:yenlei_flutter/commons/style/app_size.dart';
import 'package:yenlei_flutter/src/home/hero_buttons.dart';
import 'package:yenlei_flutter/src/home/hero_image.dart';
import 'package:yenlei_flutter/src/home/hero_texts.dart';
import 'package:yenlei_flutter/src/models/profile_model.dart';
import 'package:yenlei_flutter/src/powered_by_flutter/power_by_flutter.dart';

import '../about/about_page.dart';

class HeroWidget extends ConsumerWidget {
  const HeroWidget({super.key});

  @override
  Widget build(BuildContext context,  ref) {
    final profileAsync = ref.watch(profileProvider);

    return profileAsync.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Center(child: Text("Erreur: $err")),
      data: (Profile profile) => Column(
        children: [
          PowerByFlutter(),
          context.isDesktop || context.isTablet
              ? _LargeHero(profile)
              : _SmallHero(profile),
        ],
      ),
    );
  }
}

class _SmallHero extends StatelessWidget {
  final Profile profile;
  const _SmallHero(this.profile);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 140),
          child: HeroImage(profile: profile),
        ),
        const SizedBox(height: 16),
        HeroTexts(profile: profile),
        const SizedBox(height: 16),
        SmallHeroButtons()
      ],
    );
  }
}

class _LargeHero extends StatelessWidget {
  final Profile profile;
  const _LargeHero(this.profile);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: Insets.xl,),
        Expanded(child: HeroImage(profile: profile)),
        SizedBox(width: Insets.xl,),
        Expanded(
          flex: 2,
            child: Column(
          children: [
            HeroTexts(profile: profile),
            SizedBox(height: Insets.xl,),
            LargeHeroButtons(),
          ],
        ))
      ],
    );
  }
}


