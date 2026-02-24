import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/data/repositories/project_repository.dart';
import 'package:yenlei_flutter/src/models/project_model.dart';

final projectRepositoryProvider = Provider((ref) => ProjectRepository());

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final repo = ref.watch(projectRepositoryProvider);
  return repo.fetchProjects();
});