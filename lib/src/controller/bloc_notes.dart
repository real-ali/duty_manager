import 'dart:async';

import 'package:duty_manager/src/controller/app_error.dart';
import 'package:duty_manager/src/controller/app_status.dart';
import 'package:duty_manager/src/controller/state_notes.dart';
import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:duty_manager/src/models/note.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesBloc extends Cubit<NotesState> {
  final InterfaceApp _interface;
  NotesBloc(InterfaceApp interfaceApp)
      : _interface = interfaceApp,
        super(const NotesState.init());

  void toIdleState() {
    emit(state.copyWith(status: AppStatus.idle));
  }

  void toInitState() {
    emit(const NotesState.init());
  }

  StreamSubscription<List<Note>>? _notesSub;
  void fetchNotes() async {
    try {
      emit(state.loadingState(status: AppStatus.notesFetching));
      await _notesSub?.cancel();
      _notesSub = _interface.fetchNotes().listen((event) {
        emit(state.successState(
          notes: event,
          status: AppStatus.notesFetched,
        ));
      });
    } catch (error) {
      final appError = AppError(
        title: "title",
        description: "$error",
      );
      emit(state.failerState(
        error: appError,
        status: AppStatus.notesFailedFetch,
      ));
    }
  }

  @override
  Future<void> close() {
    _notesSub?.cancel();
    return super.close();
  }
}
