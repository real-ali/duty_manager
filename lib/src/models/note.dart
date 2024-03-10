class Note {
  final String? id;
  final String? content;
  final DateTime? creationDate;
  final DateTime? modifiedDate;

  const Note({
    required this.id,
    required this.content,
    required this.creationDate,
    required this.modifiedDate,
  });

  const Note.init({
    this.id,
    this.content,
    this.creationDate,
    this.modifiedDate,
  });

  Note copyWith({
    String? id,
    String? content,
    DateTime? creationDate,
    DateTime? modifiedDate,
  }) {
    return Note(
      id: id ?? this.id,
      content: content ?? this.content,
      creationDate: creationDate ?? this.creationDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'id': id,
      'content': content,
      'creation_date': creationDate,
      'modified_date': modifiedDate,
    };
    map.removeWhere((key, value) => value == null);
    return map;
  }

  factory Note.fromMap(Map<String, dynamic>? json) {
    if (json == null) return const Note.init();
    return Note(
      id: json['id'],
      content: json['content'],
      creationDate: json['creation_date'],
      modifiedDate: json['modified_date'],
    );
  }

  static List<Note> listFromMaps(List? list) {
    if (list == null || list.isEmpty) return const [];
    return list.map((e) => Note.fromMap(e)).toList();
  }
}
