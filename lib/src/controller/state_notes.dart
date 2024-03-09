import 'package:duty_manager/src/models/note.dart';

class NotesState {
  final List<Note> notes;

  const NotesState({
    required this.notes,
  });
  const NotesState.init({
    this.notes = const [],
  });
}
