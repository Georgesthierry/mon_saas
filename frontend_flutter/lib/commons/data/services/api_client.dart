import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  static Future<http.Response> get(String endpoint) async {
    final url = Uri.parse("${ApiConstants.baseUrl}$endpoint");

    return await http.get(
      url,
      headers: {
        "Content-Type": "application/json",
      },
    );
  }
}