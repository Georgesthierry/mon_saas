import 'package:flutter/cupertino.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Image.asset("assets/images/yenlei.png",height: 50,width: 50,),
    );
  }
}
