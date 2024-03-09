import 'package:duty_manager/src/controller/state_notes.dart';
import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesBloc extends Cubit<NotesState> {
  final InterfaceApp _interface;
  NotesBloc(InterfaceApp interfaceApp)
      : _interface = interfaceApp,
        super(const NotesState.init());
}
