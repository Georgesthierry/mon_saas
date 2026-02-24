import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/providers/project_provider.dart';
import 'package:yenlei_flutter/commons/widgets/app_scaffold.dart';
import 'package:yenlei_flutter/src/project/project_item.dart';

class ProjectPage extends ConsumerWidget {
  const ProjectPage({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final projectsAsync = ref.watch(projectsProvider);

    return AppScaffold(
      slivers: [
        projectsAsync.when(
          loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator())),
          error: (err, stack) => SliverToBoxAdapter(
              child: Center(child: Text("Erreur: $err"))),
          data: (projects) => SliverPadding(
            padding: EdgeInsets.all(context.insets.padding),
            sliver: SliverGrid.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:
                (context.mq.size.width / 300).floor() >= 3
                    ? 3
                    : (context.mq.size.width / 300).floor(),
                crossAxisSpacing: 24,
                mainAxisSpacing: 24,
                childAspectRatio: 0.8,
              ),
              itemBuilder: (context, index) {
                final project = projects[index];
                return ProjectItem(project: project);
              },
              itemCount: projects.length,
            ),
          ),
        ),
      ],
    );
  }
}