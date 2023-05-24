class AppUser {
  final String userName;
  final String name;
  final String email;
  final bool? isEmailVerified;

  final String password;

  const AppUser({
    required this.userName,
    required this.name,
    required this.password,
    required this.email,
    required this.isEmailVerified,
  });

  const AppUser.init({
    this.name = '',
    this.password = '',
    this.userName = '',
    this.email = '',
    this.isEmailVerified,
  });

  AppUser copyWith(
      {String? name,
      String? userName,
      String? email,
      String? password,
      bool? isEmailVerified}) {
    return AppUser(
      name: name ?? this.name,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      email: email ?? this.email,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
    );
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'name': name,
      'username': userName,
      'email': email,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory AppUser.fromJson(Map<String, dynamic>? json) {
    if (json == null) return const AppUser.init();
    return AppUser(
      name: json['name'] ?? '',
      userName: json['username'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
      isEmailVerified: json['isEmailVerified'] ?? false,
    );
  }
}
