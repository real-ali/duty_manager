class AppUser {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  const AppUser.init({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'id': id,
      'name': name,
      'email': email,
      'phone_number': phoneNumber
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory AppUser.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const AppUser.init();
    return AppUser(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phone_number'],
    );
  }
}
