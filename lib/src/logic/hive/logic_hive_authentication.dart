import 'package:duty_manager/src/models/user.dart';
import 'package:duty_manager/src/options/options_auth.dart';
import 'package:kooza_flutter/kooza_flutter.dart';

class LogicHiveAuthentication extends OptionsAuth {
  final Kooza _localDb;

  LogicHiveAuthentication(Kooza collection) : _localDb = collection;

  @override
  Future<bool> enteringToSystem(AppUser user) async {
    try {
      var box = _localDb.collection('users');
      await box.delete();
      await box.add(user.toJson());
      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<Map<String, dynamic>> currentUserData() {
    try {
      return _localDb.collection('users').snapshots().asyncMap((event) async {
        return event.toMap();
      });
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> clearAll() async {
    try {
      var box = _localDb.collection('users');
      await box.delete();
      await _localDb.clear();
      final data = await box.get();

      return data.isEmpty();
    } catch (e) {
      rethrow;
    }
  }
}
