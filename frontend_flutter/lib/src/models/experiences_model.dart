import 'dart:convert';


class Experience {
  final String company;
  final String role;
  final List<String> descriptions;
  final DateTime? startDate;
  final DateTime? endDate;

  Experience({
    required this.company,
    required this.role,
    required this.descriptions,
    this.startDate,
    this.endDate,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    List<String> parsedDescriptions = [];

    if (json['description'] != null) {
      final raw = json['description'];

      if (raw is String) {
        try {
          final decoded = jsonDecode(raw);
          if (decoded is List) {
            parsedDescriptions =
                decoded.map((e) => e.toString()).toList();
          }
        } catch (e) {
          parsedDescriptions = [raw];
        }
      }
    }

    return Experience(
      company: json['company'] ?? '',
      role: json['role'] ?? '',
      descriptions: parsedDescriptions,
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'])
          : null,
    );
  }
}