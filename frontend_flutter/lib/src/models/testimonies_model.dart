// To parse this JSON data, do
//
//     final testimony = testimonyFromJson(jsonString);

import 'dart:convert';

Testimony testimonyFromJson(String str) =>
    Testimony.fromJson(json.decode(str));

String testimonyToJson(Testimony data) => json.encode(data.toJson());

class Testimony {
  int id;
  String name;
  String company;
  String message;
  String? photo;

  Testimony({
    required this.id,
    required this.name,
    required this.company,
    required this.message,
    this.photo,
  });

  factory Testimony.fromJson(Map<String, dynamic> json) => Testimony(
    id: json["id"],
    name: json["name"],
    company: json["company"],
    message: json["message"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "company": company,
    "message": message,
    "photo": photo,
  };
}