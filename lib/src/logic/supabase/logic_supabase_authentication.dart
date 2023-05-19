import 'package:duty_manager/src/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LogicSupabaseAuthentication {
  final void configuration;
  LogicSupabaseAuthentication(this.configuration);
  Future<bool> checkUserIDExist(AppUser user) async {
    try {
      var tableName = 'users';
      var userName = user.userName;
      final client = Supabase.instance.client;

      final sql = "SELECT * FROM $tableName WHERE userName = '$userName'";

      final response = await client.from('sql').select(sql).execute();
      final count = response.data[0]['count'];

      if (count > 0) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> postUsersData(AppUser user) {
    // TODO: implement enteringToSystem
    throw UnimplementedError();
  }

  Future<bool> getUsersData(AppUser user) {
    // TODO: implement enteringToSystem
    throw UnimplementedError();
  }
}
