import 'package:duty_manager/src/controller/state_note.dart';
import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBloc extends Cubit<NoteState> {
  final InterfaceApp _interface;
  NoteBloc(InterfaceApp interfaceApp)
      : _interface = interfaceApp,
        super(const NoteState.init());
}
