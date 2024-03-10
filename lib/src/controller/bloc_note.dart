import 'package:duty_manager/src/controller/app_status.dart';
import 'package:duty_manager/src/controller/state_note.dart';
import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBloc extends Cubit<NoteState> {
  final InterfaceApp _interface;
  NoteBloc(InterfaceApp interfaceApp)
      : _interface = interfaceApp,
        super(const NoteState.init());

  void toIdleState() {
    emit(state.copyWith(status: AppStatus.idle));
  }

  void toInitState() {
    emit(const NoteState.init());
  }

  void setContent(String value) {
    final note = state.note.copyWith(content: value);
    emit(state.copyWith(note: note));
  }

  void createNote() {}
}
