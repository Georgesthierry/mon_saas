import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/widgets/my_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          MyAppBar(),
        ],
      )
    );
  }
}
