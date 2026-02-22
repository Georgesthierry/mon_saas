import 'package:flutter/material.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/app_scaffold.dart';
import 'package:yenlei_flutter/src/project/project_item.dart';

class ProjectPage extends StatelessWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        slivers: [
          SliverPadding(
              padding: EdgeInsets.all(context.insets.padding),
            sliver: SliverGrid.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: (context.mq.size.width / 300).floor() >= 3
                      ? 3
                      : (context.mq.size.width / 300).floor(),
                crossAxisSpacing: 24,
                childAspectRatio: 0.8,
                mainAxisSpacing: 24),
              itemBuilder: (context, index){
              return ProjectItem();
            },itemCount: 10,),
          )
        ]);
  }
}
