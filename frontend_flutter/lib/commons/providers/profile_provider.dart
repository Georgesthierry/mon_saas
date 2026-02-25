import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/commons/data/services/api_client.dart';
import 'package:yenlei_flutter/src/models/profile_model.dart';

final profileProvider = FutureProvider<Profile>((ref) async {
  final data = await ApiService.getData(
      "${ApiConstants.baseUrl}${ApiConstants.profile}");

  return Profile.fromJson(data[0]);
});