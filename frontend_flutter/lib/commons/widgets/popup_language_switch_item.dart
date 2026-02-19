import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';

class PopupLanguageSwitchItem extends StatelessWidget {
  const PopupLanguageSwitchItem({super.key, required this.language, required this.icon});

  final String language;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          width:18,
          height:18
        ),
        SizedBox(width: 8,),
        SEOText(language, )
      ],
    );
  }
}
