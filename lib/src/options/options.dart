import '../models/user.dart';

abstract class Options {
  Future<bool> signIn(User user);
}
