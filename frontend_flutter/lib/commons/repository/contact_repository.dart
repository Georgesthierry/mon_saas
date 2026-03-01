import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/src/models/contact_model.dart';


class ContactRepository {
  Future<void> sendContact(Contact contact) async {
    final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.contact}");
    final body = jsonEncode(contact.toJson());

    print("POST $url");
    print("Request body: $body");

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    print("Status code: ${response.statusCode}");
    print("Response body: ${response.body}");

    // Gestion complète des codes de retour
    if (response.statusCode == 201) {
      // Création réussie
      return;
    } else if (response.statusCode == 400) {
      // Mauvaise requête
      throw Exception("Données invalides : ${response.body}");
    } else if (response.statusCode == 500) {
      // Erreur interne serveur
      throw Exception("Erreur serveur : ${response.body}");
    } else {
      throw Exception(
          "Erreur inconnue (code ${response.statusCode}) : ${response.body}");
    }
  }
}