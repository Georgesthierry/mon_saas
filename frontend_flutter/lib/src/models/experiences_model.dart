// To parse this JSON data, do
//
//     final experience = experienceFromJson(jsonString);

import 'dart:convert';

Experience experienceFromJson(String str) =>
    Experience.fromJson(json.decode(str));

String experienceToJson(Experience data) => json.encode(data.toJson());

class Experience {
  int id;
  String company;
  String role;
  String description;
  DateTime startDate;
  DateTime? endDate;

  Experience({
    required this.id,
    required this.company,
    required this.role,
    required this.description,
    required this.startDate,
    this.endDate,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
    id: json["id"],
    company: json["company"],
    role: json["role"],
    description: json["description"],
    startDate: DateTime.parse(json["start_date"]),
    endDate: json["end_date"] != null
        ? DateTime.parse(json["end_date"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company": company,
    "role": role,
    "description": description,
    "start_date": startDate.toIso8601String(),
    "end_date": endDate?.toIso8601String(),
  };
}