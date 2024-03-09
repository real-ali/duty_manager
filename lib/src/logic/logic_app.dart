import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:duty_manager/src/models/note.dart';
import 'package:duty_manager/src/models/task.dart';
import 'package:kooza_flutter/kooza_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class LogicApp implements InterfaceApp {
  final Kooza _kooza;
  // final SupabaseClient _supabaseClient;

  LogicApp({
    required Kooza kooza,
    // required SupabaseClient supabaseClient,
  }) : _kooza = kooza;
  // _supabaseClient = supabaseClient;

  @override
  Future<void> createNote(Note note) {
    // TODO: implement createNote
    throw UnimplementedError();
  }

  @override
  Future<void> createNotesBackup(List<Note> notes) async {
    final client = Supabase.instance.client;
    // TODO: implement createNotesBackup
    throw UnimplementedError();
  }

  @override
  Future<void> createTasksBackup(List<Note> notes) async {
    final client = Supabase.instance.client;
    // TODO: implement createTasksBackup
    throw UnimplementedError();
  }

  @override
  Future<void> createtask(Task task) {
    // TODO: implement createtask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNote(Uuid id) {
    // TODO: implement deleteNote
    throw UnimplementedError();
  }

  @override
  Future<void> deleteNotes([List<Uuid>? ids]) {
    // TODO: implement deleteNotes
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTask(Uuid id) {
    // TODO: implement deleteTask
    throw UnimplementedError();
  }

  @override
  Future<void> deleteTasks([List<Uuid>? ids]) {
    // TODO: implement deleteTasks
    throw UnimplementedError();
  }

  @override
  Stream<List<Task>> fetchNotes() {
    // TODO: implement fetchNotes
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> fetchNotesBackup() {
    final client = Supabase.instance.client;
    // TODO: implement fetchNotesBackup
    throw UnimplementedError();
  }

  @override
  Stream<List<Task>> fetchTasks() {
    // TODO: implement fetchTasks
    throw UnimplementedError();
  }

  @override
  Future<List<Note>> fetchTaskseBackup() {
    final client = Supabase.instance.client;
    // TODO: implement fetchTaskseBackup
    throw UnimplementedError();
  }

  @override
  Future<void> modifyNote(Note note) {
    // TODO: implement modifyNote
    throw UnimplementedError();
  }

  @override
  Future<void> modifyTask(Task task) {
    // TODO: implement modifyTask
    throw UnimplementedError();
  }
}
