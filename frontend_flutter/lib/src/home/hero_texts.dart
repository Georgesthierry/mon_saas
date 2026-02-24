import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';
import 'package:yenlei_flutter/src/models/profile_model.dart';

class HeroTexts extends StatelessWidget {
  final Profile profile;
  const HeroTexts({super.key, required this.profile,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktopOrTablet? CrossAxisAlignment.start:CrossAxisAlignment.center,
      children: [
        SEOText(
          profile.name,
          textAlign:
          context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleLgBold.copyWith(
            color: context.colorScheme.onBackground,
          ),
          textRendererStyle: TextRendererStyle.header1,
        ),
        SizedBox(height: 5,),
        SEOText(
          profile.profession,
          textAlign:
          context.isDesktopOrTablet? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleSmBold.copyWith(
            color: context.colorScheme.tertiary,
          ),
          textRendererStyle: TextRendererStyle.header2,
        ),
        SizedBox(width: 15,),
        SEOText(
          profile.description,
          textAlign:
          context.isDesktopOrTablet? TextAlign.left : TextAlign.center,
          style: context.textStyle.bodyLgMedium.copyWith(
            color: context.colorScheme.onSurface,
          ),
          textRendererStyle: TextRendererStyle.header3,
        ),
      ],
    );
  }
}
