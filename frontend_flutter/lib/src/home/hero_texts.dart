import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';

class HeroTexts extends StatelessWidget {
  const HeroTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: context.isDesktopOrTablet? CrossAxisAlignment.start:CrossAxisAlignment.center,
      children: [
        SEOText(
          context.texts.myname,
          textAlign:
          context.isDesktopOrTablet ? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleLgBold.copyWith(
            color: context.colorScheme.onBackground,
          ),
          textRendererStyle: TextRendererStyle.header1,
        ),
        SizedBox(height: 5,),
        SEOText(
          context.texts.profession,
          textAlign:
          context.isDesktopOrTablet? TextAlign.left : TextAlign.center,
          style: context.textStyle.titleSmBold.copyWith(
            color: context.colorScheme.tertiary,
          ),
          textRendererStyle: TextRendererStyle.header2,
        ),
        SizedBox(width: 15,),
        SEOText(
          context.texts.profile,
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
