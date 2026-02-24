import 'package:http/http.dart' as http;
import 'package:yenlei_flutter/commons/constantes/api_constants.dart';
import 'package:yenlei_flutter/src/models/project_model.dart';

class ProjectRepository {
  Future<List<Project>> fetchProjects() async {
    final response = await http.get(
      Uri.parse("${ApiConstants.baseUrl}${ApiConstants.projectEndpoint}"),
    );

    if (response.statusCode == 200) {
      return projectListFromJson(response.body);
    } else {
      throw Exception("Erreur lors du chargement des projets");
    }
  }
}