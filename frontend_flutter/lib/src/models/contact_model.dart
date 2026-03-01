class Contact {
  final String name;
  final String email;
  final String subject;
  final String message;
  final bool? isRead;

  Contact({
    required this.name,
    required this.email,
    required this.subject,
    required this.message,
    this.isRead,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      subject: json['subject'] ?? '',
      message: json['message'] ?? '',
      isRead: json['is_read'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "subject": subject,
      "message": message,
      "is_read": isRead ?? false,
    };
  }
}