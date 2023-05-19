import '../models/user.dart';

abstract class OptionsAuth {
  Stream<Map<String, dynamic>?> currentUserData();
  Future<bool> enteringToSystem(AppUser user);
  Future<bool> clearAll();
}
