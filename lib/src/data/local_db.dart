import 'package:duty_manager/src/models/user.dart';
import 'package:duty_manager/src/options/options.dart';
import 'package:hive/hive.dart';

class LocalDb implements Options {
  @override
  Future<bool> signIn(User user) async {
    try {
      final collection = await BoxCollection.open(
        'dutyManager', // Name of your database
        {'users'}, // Names of your boxes
        path: './',
      );
      final users = await collection.openBox<Map>('users');

      await users.put(user.id, user.toJson());
      return await users.get(user.id) != null;
    } catch (e) {
      throw "SignIn faild";
    }
  }
}
