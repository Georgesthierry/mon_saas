import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:yenlei_flutter/commons/constantes/background_blur.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/style/app_size.dart';
import 'package:yenlei_flutter/commons/widgets/app_scaffold.dart';
import 'package:yenlei_flutter/commons/widgets/drawer_menu.dart';
import 'package:yenlei_flutter/commons/widgets/home_title_subtitle.dart';
import 'package:yenlei_flutter/commons/widgets/my_app_bar.dart';
import 'package:yenlei_flutter/src/experience/experience_body.dart';
import 'package:yenlei_flutter/src/footer/my_footer.dart';
import 'package:yenlei_flutter/src/home/hero_widget.dart';
import 'package:yenlei_flutter/src/project/home_project_list.dart';
import 'package:yenlei_flutter/src/project/testimony_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        slivers: [
          SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
                child: HeroWidget(),
              )),
          SliverGap(context.insets.gap),
          SliverToBoxAdapter(
              child: HomeProjectList()),
          SliverGap(context.insets.gap),
          SliverToBoxAdapter(
              child: ExperienceBody()),
          SliverGap(context.insets.gap),
          SliverToBoxAdapter(
            child: HomeTitleSubtitle(title: context.texts.testimonies, subtitle: context.texts.testimoniesDescription),
          ),
          SliverGap(32),
          SliverPadding(
              padding: EdgeInsets.symmetric(horizontal :context.insets.padding),
              sliver: TestimonyList()),
        ]
    );
  }
}
