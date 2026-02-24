import 'package:http/http.dart' as http;
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/src/models/profile_model.dart';

class ProfileService {
  Future<Profile> getProfile() async {
    final response = await http.get(Uri.parse("${ApiConstants.baseUrl}${ApiConstants.profileEndpoint}"));

    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      throw Exception("Erreur chargement profil");
    }
  }
}