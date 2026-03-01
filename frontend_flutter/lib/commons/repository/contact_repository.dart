import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/src/models/contact_model.dart';


class ContactRepository {
  Future<void> sendContact(Contact contact) async {
    final url = Uri.parse("${ApiConstants.baseUrl}${ApiConstants.contact}");
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(contact.toJson()),
    );

    if (response.statusCode != 200 && response.statusCode != 201) {
      print("Status: ${response.statusCode}");
      print("Body: ${response.body}");
      throw Exception("Erreur envoi message: ${response.body}");
    }
  }
}