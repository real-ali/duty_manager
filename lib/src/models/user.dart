class User {
  final String id;
  final String name;
  final String email;
  final String? phoneNumber;

  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
  });

  const User.init({
    this.id = '',
    this.name = '',
    this.email = '',
    this.phoneNumber,
  });

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? phoneNumber,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  User fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
