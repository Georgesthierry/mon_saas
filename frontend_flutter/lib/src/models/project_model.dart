import 'dart:convert';

Project projectFromJson(String str) => Project.fromJson(json.decode(str));

String projectToJson(Project data) => json.encode(data.toJson());

class Project {
  int id;
  String title;
  String description;
  String image;
  String url;
  DateTime createdAt;

  Project({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.url,
    required this.createdAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) => Project(
    id: json["id"],
    title: json["title"],
    description: json["description"],
    image: json["image"],
    url: json["url"],
    createdAt: DateTime.parse(json["created_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "description": description,
    "image": image,
    "url": url,
    "created_at": createdAt.toIso8601String(),
  };
}
