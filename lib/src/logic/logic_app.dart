import 'package:duty_manager/src/interface/interface_app.dart';
import 'package:duty_manager/src/models/note.dart';
import 'package:duty_manager/src/models/task.dart';
import 'package:kooza_flutter/kooza_flutter.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

class LogicApp implements InterfaceApp {
  final Kooza _kooza;
  final Uuid _uuid;

  LogicApp({
    required Kooza kooza,
    required Uuid uuid,
  })  : _kooza = kooza,
        _uuid = uuid;

  final _noteCollection = "note";
  final _taskCollection = "note";

  @override
  Future<void> createNote(Note note) async {
    try {
      final collection = _kooza.collection(_noteCollection);
      final id = _uuid.v4();
      final creationDate = DateTime.now();
      final data = note.copyWith(
        id: id,
        creationDate: creationDate,
      );
      await collection.add(data.toMap(), docId: id);
    } catch (_) {
      rethrow;
    }
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
  Future<void> createtask(Task task) async {
    try {
      final collection = _kooza.collection(_taskCollection);
      final id = _uuid.v4();
      final creationDate = DateTime.now();
      final data = task.copyWith(
        id: id,
        creationDate: creationDate,
      );
      await collection.add(data.toMap(), docId: id);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNote(String id) async {
    try {
      final collection = _kooza.collection(_noteCollection);
      await collection.doc(id).delete();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteNotes([List<String>? ids]) async {
    if (ids == null) return;

    try {
      final collection = _kooza.collection(_noteCollection);
      final data = await collection.get();
      if (ids.length == data.docs.length) {
        await collection.delete();
        return;
      }
      ids.map((id) async {
        await collection.doc(id).delete();
      });
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTask(String id) async {
    try {
      final collection = _kooza.collection(_taskCollection);
      await collection.doc(id).delete();
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> deleteTasks([List<String>? ids]) async {
    if (ids == null) return;
    try {
      final collection = _kooza.collection(_taskCollection);
      final data = await collection.get();
      if (ids.length == data.docs.length) {
        await collection.delete();
        return;
      }
      ids.map((id) async {
        await collection.doc(id).delete();
      });
    } catch (_) {
      rethrow;
    }
  }

  @override
  Stream<List<Note>> fetchNotes() async* {
    try {
      final collection = _kooza.collection(_noteCollection);
      final list = await collection.snapshots().toList();
      yield Note.listFromMaps(list);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Note>> fetchNotesBackup() {
    final client = Supabase.instance.client;
    // TODO: implement fetchNotesBackup
    throw UnimplementedError();
  }

  @override
  Stream<List<Task>> fetchTasks() async* {
    try {
      final collection = _kooza.collection(_taskCollection);

      final list = await collection.snapshots().toList();
      yield Task.listFromMaps(list);
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<List<Note>> fetchTaskseBackup() {
    final client = Supabase.instance.client;
    // TODO: implement fetchTaskseBackup
    throw UnimplementedError();
  }

  @override
  Future<void> modifyNote(Note note) async {
    try {
      final modificationDate = DateTime.now();
      final data = note.copyWith(modifiedDate: modificationDate);
      final collection = _kooza.collection(_noteCollection);
      await collection.doc(note.id!).set(data.toMap());
    } catch (_) {
      rethrow;
    }
  }

  @override
  Future<void> modifyTask(Task task) async {
    try {
      final modificationDate = DateTime.now();
      final data = task.copyWith(modifiedDate: modificationDate);
      final collection = _kooza.collection(_taskCollection);
      await collection.doc(task.id!).set(data.toMap());
    } catch (_) {
      rethrow;
    }
  }
}
