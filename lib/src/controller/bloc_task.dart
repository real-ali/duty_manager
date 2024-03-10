import 'package:duty_manager/src/controller/app_status.dart';
import 'package:duty_manager/src/controller/state_task.dart';
import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskBloc extends Cubit<TaskState> {
  final InterfaceApp _interface;
  TaskBloc(InterfaceApp interfaceApp)
      : _interface = interfaceApp,
        super(const TaskState.init());

  void toIdleState() {
    emit(state.copyWith(status: AppStatus.idle));
  }

  void toInitState() {
    emit(const TaskState.init());
  }

  void setParentId(String value) {
    final task = state.task.copyWith(parentId: value);
    emit(state.copyWith(task: task));
  }

  void setTitle(String value) {
    final task = state.task.copyWith(title: value);
    emit(state.copyWith(task: task));
  }

  void setDescription(String value) {
    final task = state.task.copyWith(description: value);
    emit(state.copyWith(task: task));
  }

  void setIsDone(bool value) {
    final task = state.task.copyWith(isDone: value);
    emit(state.copyWith(task: task));
  }
}
