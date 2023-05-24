import 'package:duty_manager/src/options/online/online_options_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';

class LogicSupabaseAuthentication implements OnlineOptionsAuth {
  @override
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signInWithTwitter() async {
    try {
      // Create a TwitterLogin instance
      final twitterLogin = TwitterLogin(
          apiKey: '1594596015901908995-Qw2JWVM3adPWtzcaLMOMjXso3RzPvI',
          apiSecretKey: 'PmHdxfB2n0HohJrv2G3z9qZ7Zt1XkF6J2hdVjILWNEiHF',
          redirectURI:
              'https://duty-manager-1994a.firebaseapp.com/__/auth/handler');

      // Trigger the sign-in flow
      final authResult = await twitterLogin.login();

      // Create a credential from the access token
      TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      rethrow;
    }
  }
}
