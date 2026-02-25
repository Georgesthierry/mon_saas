// Parsing JSON en liste de Testimony
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';

import '../../src/models/testimonies_model.dart';

List<Testimony> testimoniesFromJson(String str) {
  final jsonData = json.decode(str) as List;
  return jsonData.map((e) => Testimony.fromJson(e)).toList();
}

// Provider
final testimonyProvider = FutureProvider<List<Testimony>>((ref) async {
  final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.testimonies}");
  final res = await http.get(url);

  if (res.statusCode == 200) {
    return testimoniesFromJson(res.body);
  } else {
    throw Exception("Impossible de charger les témoignages");
  }
});