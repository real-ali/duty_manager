import 'dart:async';

import 'package:duty_manager/src/controller/app_error.dart';
import 'package:duty_manager/src/controller/app_status.dart';
import 'package:duty_manager/src/controller/state_tasks.dart';
import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:duty_manager/src/models/task.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TasksBloc extends Cubit<TasksState> {
  final InterfaceApp _interface;
  TasksBloc(InterfaceApp interfaceApp)
      : _interface = interfaceApp,
        super(const TasksState.init());

  void toIdleState() {
    emit(state.copyWith(status: AppStatus.idle));
  }

  void toInitState() {
    emit(const TasksState.init());
  }

  StreamSubscription<List<Task>>? _tasksSub;
  void fetchNote() async {
    try {
      emit(state.loadingState(status: AppStatus.tasksFetching));
      await _tasksSub?.cancel();
      _tasksSub = _interface.fetchTasks().listen((event) {
        emit(state.successState(
          tasks: event,
          status: AppStatus.tasksFetched,
        ));
      });
    } catch (error) {
      final appError = AppError(
        title: "title",
        description: "$error",
      );
      emit(state.failerState(
        error: appError,
        status: AppStatus.tasksFailedFetch,
      ));
    }
  }

  @override
  Future<void> close() {
    _tasksSub?.cancel();
    return super.close();
  }
}
