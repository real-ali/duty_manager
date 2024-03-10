import 'package:duty_manager/src/controller/app_error.dart';
import 'package:duty_manager/src/controller/app_status.dart';
import 'package:duty_manager/src/models/note.dart';

class NoteState {
  final AppStatus status;
  final AppError error;
  final Note note;

  const NoteState({
    required this.note,
    required this.status,
    required this.error,
  });
  const NoteState.init({
    this.note = const Note.init(),
    this.status = AppStatus.idle,
    this.error = const AppError.init(),
  });

  NoteState copyWith({
    AppStatus? status,
    Note? note,
    AppError? error,
  }) {
    return NoteState(
      note: note ?? this.note,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  NoteState loadingState({
    AppStatus? status,
  }) {
    return NoteState(
      note: note,
      status: status ?? this.status,
      error: error,
    );
  }

  NoteState successState({
    Note? note,
    AppStatus? status,
  }) {
    return NoteState(
      note: note ?? this.note,
      status: status ?? this.status,
      error: error,
    );
  }

  NoteState failerState({
    AppError? error,
    AppStatus? status,
  }) {
    return NoteState(
      note: note,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
