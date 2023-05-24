import '../../models/user.dart';

abstract class LocalOptionsAuth {
  Stream<Map<String, dynamic>?> fetchUserData();
  Stream<Map<String, dynamic>> fetchLocalSetting();
  Future<bool> enteringToSystem(AppUser user, bool? isLocal);
  Future<void> clearAll();
}
