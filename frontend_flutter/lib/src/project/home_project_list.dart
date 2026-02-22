import 'package:flutter/cupertino.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/widgets/home_title_subtitle.dart';
import 'package:yenlei_flutter/src/project/project_item.dart';

class HomeProjectList extends StatelessWidget {
  const HomeProjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HomeTitleSubtitle(title: context.texts.projets, subtitle: context.texts.projectDescription),
        SizedBox(height: 30,),
        context.isDesktop ? _HomeProjectDesktop():_HomeProjectPhone()
      ],
    );
  }
}

class _HomeProjectDesktop extends StatelessWidget {
  const _HomeProjectDesktop({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
    child: Row(
      children: [
        Expanded(child: ProjectItem()),
        SizedBox(width: 20,),
        Expanded(child: ProjectItem()),
        SizedBox(width: 20,),
        Expanded(child: ProjectItem()),
      ],
    ),);
  }
}
class _HomeProjectPhone extends StatelessWidget {
  const _HomeProjectPhone({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(
              width: 240,
            child:ProjectItem()
              ,),
            SizedBox(
              width: 240,
              child:ProjectItem()
              ,),
            SizedBox(
              width: 240,
              child:ProjectItem()
              ,)
          ],
        ),
      ),
    );
  }
}




