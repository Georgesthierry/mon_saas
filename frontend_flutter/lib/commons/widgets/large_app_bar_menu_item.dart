import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/style/app_size.dart';
import 'package:yenlei_flutter/commons/style/app_text_styles.dart';

class LargeAppBarMenuItem extends StatelessWidget {
  const LargeAppBarMenuItem({super.key, required this.text, required this.isSelected, required this.onTap});

  final String text;
  final  isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: Insets.med,vertical: Insets.xs),
        child: Text(text,style: SmallTextStyles().bodyLgMedium,),
      ),
    );
  }
}
