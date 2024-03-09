import 'package:duty_manager/src/models/task.dart';

class TaskState {
  final Task task;

  const TaskState({
    required this.task,
  });
  const TaskState.init({
    this.task = const Task.init(),
  });
}
