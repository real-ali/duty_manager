import 'package:duty_manager/src/controller/state_task.dart';
import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Cubit<TaskState> {
  final InterfaceApp _interface;
  TaskBloc(InterfaceApp interfaceApp)
      : _interface = interfaceApp,
        super(const TaskState.init());
}
