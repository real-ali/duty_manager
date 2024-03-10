class AppError {
  final int? code;
  final String? title;
  final String? description;

  const AppError({
    this.code,
    required this.title,
    required this.description,
  });

  const AppError.init({
    this.code,
    this.title,
    this.description,
  });

  AppError copyWith({
    int? code,
    String? title,
    String? description,
  }) {
    return AppError(
      code: code ?? this.code,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }
}
