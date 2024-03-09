import 'package:duty_manager/src/models/note.dart';
import 'package:duty_manager/src/models/task.dart';
import 'package:uuid/uuid.dart';

abstract class InterfaceApp {
  Future<void> createtask(Task task);
  Future<void> deleteTask(Uuid id);
  Future<void> modifyTask(Task task);
  Future<void> deleteTasks([List<Uuid>? ids]);
  Stream<List<Task>> fetchTasks();
  Future<void> createTasksBackup(List<Note> notes);
  Future<List<Note>> fetchTaskseBackup();

  Future<void> createNote(Note note);
  Future<void> deleteNote(Uuid id);
  Future<void> modifyNote(Note note);
  Future<void> deleteNotes([List<Uuid>? ids]);
  Stream<List<Task>> fetchNotes();
  Future<void> createNotesBackup(List<Note> notes);
  Future<List<Note>> fetchNotesBackup();
}
