import 'package:uuid/uuid.dart';

class Task {
  final Uuid? id;
  final Uuid? parentId;
  final String? title;
  final String? description;
  final DateTime? creationDate;
  final DateTime? modifiedDate;
  final bool? isDone;

  const Task({
    required this.id,
    required this.parentId,
    required this.title,
    required this.description,
    required this.creationDate,
    required this.modifiedDate,
    required this.isDone,
  });

  const Task.init({
    this.id,
    this.parentId,
    this.title,
    this.description,
    this.creationDate,
    this.modifiedDate,
    this.isDone,
  });

  Task copyWith({
    Uuid? id,
    Uuid? parentId,
    String? title,
    String? description,
    DateTime? creationDate,
    DateTime? modifiedDate,
    bool? isDone,
  }) {
    return Task(
      id: id ?? this.id,
      parentId: parentId ?? this.parentId,
      title: title ?? this.title,
      description: description ?? this.description,
      creationDate: creationDate ?? this.creationDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
      isDone: isDone ?? this.isDone,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'parent_id': parentId,
      'title': title,
      'description': description,
      'creation_date': creationDate?.toIso8601String(),
      'modified_date': modifiedDate?.toIso8601String(),
      'is_done': isDone
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory Task.fromMap(Map<String, dynamic>? json) {
    if (json == null) return const Task.init();
    return Task(
        id: json['id'],
        parentId: json['parent_id'],
        title: json['title'],
        description: json['description'],
        creationDate: json['creation_date'],
        modifiedDate: json['modified_date'],
        isDone: json['is_done']);
  }

  static List<Task> listFromMaps(List? list) {
    if (list == null || list.isEmpty) return const [];
    return list.map((e) => Task.fromMap(e)).toList();
  }
}
