import 'package:duty_manager/src/controller/app_error.dart';
import 'package:duty_manager/src/controller/app_status.dart';
import 'package:duty_manager/src/models/note.dart';

class NotesState {
  final AppStatus status;
  final AppError error;
  final List<Note> notes;

  const NotesState({
    required this.notes,
    required this.status,
    required this.error,
  });
  const NotesState.init({
    this.notes = const [],
    this.status = AppStatus.idle,
    this.error = const AppError.init(),
  });

  NotesState copyWith({
    AppStatus? status,
    List<Note>? notes,
    AppError? error,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  NotesState loadingState({
    AppStatus? status,
  }) {
    return NotesState(
      notes: notes,
      status: status ?? this.status,
      error: error,
    );
  }

  NotesState successState({
    List<Note>? notes,
    AppStatus? status,
  }) {
    return NotesState(
      notes: notes ?? this.notes,
      status: status ?? this.status,
      error: error,
    );
  }

  NotesState failerState({
    AppError? error,
    AppStatus? status,
  }) {
    return NotesState(
      notes: notes,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
