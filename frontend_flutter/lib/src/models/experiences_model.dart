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
    return Experience(
      company: json['company'] ?? '',
      role: json['role'] ?? '',
      descriptions: json['description'] != null
          ? List<String>.from(json['description'])
          : [],
      startDate: json['start_date'] != null
          ? DateTime.parse(json['start_date'])
          : null,
      endDate: json['end_date'] != null
          ? DateTime.parse(json['end_date'])
          : null,
    );
  }
}