import '../models/user.dart';

abstract class Options {
  Future signIn(User user);
}
