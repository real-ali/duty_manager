import 'package:duty_manager/src/models/note.dart';

class NoteState {
  final Note notes;

  const NoteState({
    required this.notes,
  });
  const NoteState.init({
    this.notes = const Note.init(),
  });
}
