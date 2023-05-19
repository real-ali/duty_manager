class AppUser {
  final String id;
  final String userName;
  final String name;
  final String email;
  final String? phoneNumber;
  final String password;

  const AppUser({
    required this.id,
    required this.userName,
    required this.name,
    required this.password,
    required this.email,
    required this.phoneNumber,
  });

  const AppUser.init({
    this.id = '',
    this.name = '',
    this.password = '',
    this.userName = '',
    this.email = '',
    this.phoneNumber,
  });

  AppUser copyWith({
    String? id,
    String? name,
    String? userName,
    String? email,
    String? password,
    String? phoneNumber,
  }) {
    return AppUser(
      id: id ?? this.id,
      name: name ?? this.name,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'name': name,
      'username': userName,
      'email': email,
      'password': password,
      'phone_number': phoneNumber,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory AppUser.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const AppUser.init();
    return AppUser(
      id: json['id'],
      name: json['name'],
      userName: json['username'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phone_number'],
    );
  }
}
