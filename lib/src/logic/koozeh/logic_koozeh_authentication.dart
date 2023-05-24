import 'package:duty_manager/src/models/user.dart';
import 'package:duty_manager/src/options/local/local_options_auth.dart';
import 'package:kooza_flutter/kooza_flutter.dart';

class LogicKoozehAuthentication extends LocalOptionsAuth {
  final Kooza _localDb;
  final String _document = 'users';

  LogicKoozehAuthentication(Kooza collection) : _localDb = collection;

  @override
  Future<bool> enteringToSystem(AppUser user, bool? isLocal) async {
    try {
      var settingBox = _localDb.singleDoc('local_settings');
      await settingBox.set({'is_local': isLocal});
      var box = _localDb.singleDoc(_document);
      await box.set(
        user.toJson(),
      );

      return true;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<Map<String, dynamic>> fetchUserData() {
    try {
      final ref = _localDb.singleDoc(_document).snapshots();
      final result = ref.map((event) => event.toMap());

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<Map<String, dynamic>> fetchLocalSetting() {
    try {
      final ref = _localDb.singleDoc('local_settings').snapshots();
      final result = ref.map((event) => event.toMap());

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> clearAll() async {
    try {
      await _localDb.clear();
    } catch (e) {
      rethrow;
    }
  }
}
