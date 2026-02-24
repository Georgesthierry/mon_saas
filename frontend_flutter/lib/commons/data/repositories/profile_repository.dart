import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/src/models/profile_model.dart';

class ProfileRepository {
  Future<Profile> fetchProfile() async {
    final response = await http.get(Uri.parse("${ApiConstants.baseUrl}${ApiConstants.profileEndpoint}"));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      if (data.isNotEmpty) {
        return Profile.fromJson(data.first); // Prend le premier profil
      } else {
        throw Exception("Aucun profil trouvé");
      }
    } else {
      throw Exception("Erreur de chargement du profil");
    }
  }
}