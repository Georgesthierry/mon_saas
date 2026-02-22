import 'package:flutter/cupertino.dart';
import 'package:seo_renderer/renderers/text_renderer/text_renderer_style.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';

class HomeTitleSubtitle extends StatelessWidget {
  const HomeTitleSubtitle({super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SEOText(
            title,
            style: context.textStyle.titleLgBold.copyWith(
              color: context.colorScheme.onBackground,
            ),
            textRendererStyle: TextRendererStyle.header1,
          ),
          SizedBox(height: 5,),
          SEOText(
            subtitle,
            style: context.textStyle.bodyLgMedium.copyWith(
              color: context.colorScheme.onBackground,
            ),
            textRendererStyle: TextRendererStyle.header2,
          ),
        ],
      ),
    );
  }
}
