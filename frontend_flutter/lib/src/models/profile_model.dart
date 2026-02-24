import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  int id;
  String name;
  String profession;
  String description;
  String photo;
  DateTime updatedAt;

  Profile({
    required this.id,
    required this.name,
    required this.profession,
    required this.description,
    required this.photo,
    required this.updatedAt,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json["id"],
    name: json["name"],
    profession: json["profession"],
    description: json["description"],
    photo: json["photo"],
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "profession": profession,
    "description": description,
    "photo": photo,
    "updated_at": updatedAt.toIso8601String(),
  };
}