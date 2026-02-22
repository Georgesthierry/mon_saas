import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/style/app_size.dart';
import 'package:yenlei_flutter/src/home/styled_button.dart';

import '../../commons/constantes/extensions.dart';

class LargeHeroButtons extends StatelessWidget {
  const LargeHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        PrimaryButton(title: context.texts.services),
        SizedBox(width: Insets.lg,),
        OutlineButton(title: context.texts.cooperationRequest)
      ],
    );
  }
}

class SmallHeroButtons extends StatelessWidget {
  const SmallHeroButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(title: context.texts.services),

        ),
        SizedBox(height: Insets.lg,),
        SizedBox(
          width: double.infinity,
          child: OutlineButton(title: context.texts.cooperationRequest),
        ),
      ],
    );
  }
}

