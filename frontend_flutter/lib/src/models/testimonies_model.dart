import 'dart:convert';

Testimony testimonyFromJson(String str) => Testimony.fromJson(json.decode(str));

String testimonyToJson(Testimony data) => json.encode(data.toJson());

class Testimony {
  String name;
  String company;
  String message;
  dynamic photo;

  Testimony({
    required this.name,
    required this.company,
    required this.message,
    required this.photo,
  });

  factory Testimony.fromJson(Map<String, dynamic> json) => Testimony(
    name: json["name"],
    company: json["company"],
    message: json["message"],
    photo: json["photo"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "company": company,
    "message": message,
    "photo": photo,
  };
}
