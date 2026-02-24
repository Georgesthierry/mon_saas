import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/data/repositories/profile_repository.dart';
import 'package:yenlei_flutter/src/models/profile_model.dart';


final profileRepositoryProvider = Provider((ref) => ProfileRepository());


final profileProvider = FutureProvider<Profile>((ref) async {
  final repo = ref.watch(profileRepositoryProvider);
  return repo.fetchProfile();
});