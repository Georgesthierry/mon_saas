import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/src/models/service_model.dart';

/// Parsing JSON en liste de Service
List<Service> servicesFromJson(String str) {
  final jsonData = json.decode(str) as List;
  return jsonData.map((e) => Service.fromJson(e)).toList();
}
final serviceProvider = FutureProvider<List<Service>>((ref) async {
  final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.services}");
  final res = await http.get(url);

  if (res.statusCode == 200) {
    return servicesFromJson(res.body);
  } else {
    throw Exception("Impossible de charger les services");
  }
});