import 'package:duty_manager/src/controller/app_error.dart';
import 'package:duty_manager/src/controller/app_status.dart';
import 'package:duty_manager/src/models/task.dart';

class TasksState {
  final AppStatus status;
  final AppError error;
  final List<Task> tasks;

  const TasksState({
    required this.tasks,
    required this.status,
    required this.error,
  });
  const TasksState.init({
    this.tasks = const [],
    this.status = AppStatus.idle,
    this.error = const AppError.init(),
  });

  TasksState copyWith({
    AppStatus? status,
    List<Task>? tasks,
    AppError? error,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }

  TasksState loadingState({
    AppStatus? status,
  }) {
    return TasksState(
      tasks: tasks,
      status: status ?? this.status,
      error: error,
    );
  }

  TasksState successState({
    List<Task>? tasks,
    AppStatus? status,
  }) {
    return TasksState(
      tasks: tasks ?? this.tasks,
      status: status ?? this.status,
      error: error,
    );
  }

  TasksState failerState({
    AppError? error,
    AppStatus? status,
  }) {
    return TasksState(
      tasks: tasks,
      status: status ?? this.status,
      error: error ?? this.error,
    );
  }
}
