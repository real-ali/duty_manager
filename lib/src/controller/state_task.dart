import 'package:duty_manager/src/controller/app_error.dart';
import 'package:duty_manager/src/controller/app_status.dart';
import 'package:duty_manager/src/models/task.dart';

class TaskState {
  final AppStatus status;
  final AppError error;
  final Task task;

  const TaskState({
    required this.task,
    required this.status,
    required this.error,
  });
  const TaskState.init({
    this.task = const Task.init(),
    this.status = AppStatus.idle,
    this.error = const AppError.init(),
  });

  TaskState copyWith({
    AppStatus? status,
    Task? task,
    AppError? error,
  }) {
    return TaskState(
      task: task ?? this.task,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  TaskState loadingState({
    AppStatus? status,
  }) {
    return TaskState(
      task: task,
      status: status ?? this.status,
      error: error,
    );
  }

  TaskState successState({
    Task? task,
    AppStatus? status,
  }) {
    return TaskState(
      task: task ?? this.task,
      status: status ?? this.status,
      error: error,
    );
  }

  TaskState failerState({
    AppError? error,
    AppStatus? status,
  }) {
    return TaskState(
      task: task,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
