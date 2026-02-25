class Profile {
  final int id;
  final String photo;
  final String name;
  final String profession;
  final String description;

  Profile({
    required this.id,
    required this.photo,
    required this.name,
    required this.profession,
    required this.description,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      photo: json['photo'],
      name: json['name'],
      profession: json['profession'],
      description: json['description'],
    );
  }
}