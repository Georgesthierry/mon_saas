import 'package:flutter/material.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';
import 'package:yenlei_flutter/commons/widgets/styled_card.dart';

class ProjectItem extends StatelessWidget {
  const ProjectItem({super.key});

  @override
  Widget build(BuildContext context) {
    return StyledCard(
      child: AspectRatio(
          aspectRatio: 0.7,
      child:Column(
        children: [
          AspectRatio(aspectRatio: 1.5,
          child: ClipRRect(
            child: Image.network('https://dummyimage.com/350x250/33cc99/fff'),
            
          ),),
          SizedBox(width: 24,),
          SEOText('Random text', style: context.textStyle.bodyLgBold.copyWith(
            color: context.colorScheme.onBackground
          ),
            textRendererStyle: TextRendererStyle.header4,
          ),
          SizedBox(width: 8,),
          Expanded(child: SEOText('Some description text for testing', style: context.textStyle.bodyLgMedium.copyWith(color: context.colorScheme.onSurface),
          maxLines: 4,
          overflow: TextOverflow.ellipsis,))
        ],
      ) ,),
    );
  }
}
