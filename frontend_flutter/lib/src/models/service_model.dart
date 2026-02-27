class Service {
  final int id;
  final String title;
  final String description;
  final String? icon;

  Service({required this.id, required this.title, required this.description, this.icon});

  factory Service.fromJson(Map<String, dynamic> json) => Service(
    id: json['id'],
    title: json['title'],
    description: json['description'],
    icon: json['icon'],
  );
}