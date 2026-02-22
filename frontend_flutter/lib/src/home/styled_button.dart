import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/style/kolors.dart';
import 'package:yenlei_flutter/commons/widgets/seotext.dart';

class PrimaryButton extends StatelessWidget {
  final String title;
  const PrimaryButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 102,
      child: ElevatedButton(
          onPressed: (){}, child: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.w500,color: AppColors.gray[100]),)),
    );
  }
}



class OutlineButton extends StatelessWidget {
  final String title;
  const OutlineButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: (){},
      child: SEOText(
        title, style: TextStyle(
          fontWeight: FontWeight.w500,color: context.colorScheme.onBackground),),
    );
  }
}
