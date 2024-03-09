import 'package:duty_manager/src/models/task.dart';

class TasksState {
  final List<Task> tasks;

  const TasksState({
    required this.tasks,
  });
  const TasksState.init({
    this.tasks = const [],
  });
}
