import 'package:duty_manager/src/controller/state_tasks.dart';
import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksBloc extends Cubit<TasksState> {
  final InterfaceApp _interface;
  TasksBloc(InterfaceApp interfaceApp)
      : _interface = interfaceApp,
        super(const TasksState.init());
}
