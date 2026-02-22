import 'package:flutter/cupertino.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';

class PowerByFlutter extends StatelessWidget {
  const PowerByFlutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/flutter.png",width:24,height: 24,color: context.colorScheme.onBackground,),
        SizedBox(width: 8,),
        Text(context.texts.poweredByFlutter,style: context.textStyle.bodyMdMedium.copyWith(
          color: context.colorScheme.onBackground
        ),)
      ],
    );
  }
}
