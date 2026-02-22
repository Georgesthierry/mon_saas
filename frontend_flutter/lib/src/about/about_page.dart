import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/app_scaffold.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(padding: EdgeInsets.symmetric(horizontal: context.insets.padding),child: Column(children: [CircleAvatar(
              radius: 100,
              backgroundImage: Image.asset("assets/images/photo_georges.jpeg").image,
            ),
              SizedBox(width: 16,),
              SEOText(context.texts.aboutTitle,style: context.textStyle.titleSmBold,),
              SizedBox(width: 16,),
              SEOText(context.texts.aboutDescription,style: context.textStyle.bodyMdMedium,),

            ],),),
          )
        ]);
  }
}
