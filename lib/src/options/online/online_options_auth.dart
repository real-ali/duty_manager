abstract class OnlineOptionsAuth {
  Future<void> signInWithGoogle();
  Future<void> signInWithTwitter();
  Future<void> signOut();
  // Stream<AppUser> fetchUserData(AppUser user);
  // Future<bool?> checkUserIDExist(AppUser user);
  // Future<bool?> checkEmailInUsed(AppUser user);
  // Future<bool?> checkEmailVarified(AppUser user);
  // Stream<void> uploadUserData();
  // Future<bool> signUp(AppUser user);
  // Future<bool> signIn(AppUser user);
}
