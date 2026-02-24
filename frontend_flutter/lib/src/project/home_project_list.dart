import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/extensions.dart';
import 'package:yenlei_flutter/commons/providers/project_provider.dart';
import 'package:yenlei_flutter/commons/widgets/home_title_subtitle.dart';
import 'package:yenlei_flutter/src/project/project_item.dart';
import 'package:yenlei_flutter/src/models/project_model.dart';





class HomeProjectList extends ConsumerWidget {
  const HomeProjectList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectsProvider);

    return projectsAsync.when(
      loading: () => const Center(child: CupertinoActivityIndicator()),
      error: (err, stack) => Center(child: Text("Erreur: $err")),
      data: (projects) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            HomeTitleSubtitle(
              title: context.texts.projets,
              subtitle: context.texts.projectDescription,
            ),
            const SizedBox(height: 30),
            context.isDesktop
                ? _HomeProjectDesktop(projects: projects)
                : _HomeProjectPhone(projects: projects),
          ],
        );
      },
    );
  }
}

class _HomeProjectDesktop extends StatelessWidget {
  final List<Project> projects;
  const _HomeProjectDesktop({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    // Affiche au maximum 3 projets
    final displayedProjects = projects.take(3).toList();

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
      child: Row(
        children: List.generate(displayedProjects.length, (index) {
          return Expanded(
            child: ProjectItem(project: displayedProjects[index]),
          );
        }).expand((widget) => [
          widget,
          const SizedBox(width: 20),
        ]).toList()
          ..removeLast(), // Supprime le dernier SizedBox
      ),
    );
  }
}

// Version Phone : Scroll horizontal
class _HomeProjectPhone extends StatelessWidget {
  final List<Project> projects;
  const _HomeProjectPhone({super.key, required this.projects});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 350, // hauteur fixe pour le scroll horizontal
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: context.insets.padding),
        itemCount: projects.length,
        separatorBuilder: (_, __) => const SizedBox(width: 16),
        itemBuilder: (context, index) {
          return SizedBox(
            width: 240,
            child: ProjectItem(project: projects[index]),
          );
        },
      ),
    );
  }
}