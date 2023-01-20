part of 'sign_in_cubit.dart';

class SignInState {
  final bool isLacal;
  final bool hasError;
  final bool isLoading;
  final bool isSuccess;
  final bool isSignIn;
  final String error;
  final User user;

  SignInState({
    required this.isLacal,
    required this.hasError,
    required this.isLoading,
    required this.isSuccess,
    required this.error,
    required this.user,
    required this.isSignIn,
  });
  SignInState.init({
    this.isLacal = false,
    this.hasError = false,
    this.isLoading = false,
    this.isSuccess = false,
    this.error = '',
    this.user = const User.init(),
    this.isSignIn = false,
  });

  SignInState errorState(String err) {
    return SignInState(
      isLacal: isLacal,
      hasError: true,
      isLoading: false,
      isSuccess: false,
      error: err,
      user: const User.init(),
      isSignIn: false,
    );
  }

  SignInState successState(User user, [bool? isSignIn, bool? isLacal]) {
    return SignInState(
      isLacal: isLacal ?? this.isLacal,
      hasError: false,
      isLoading: false,
      isSuccess: true,
      error: '',
      user: user,
      isSignIn: isSignIn ?? this.isSignIn,
    );
  }

  SignInState loadingState() {
    return SignInState(
      isLacal: isLacal,
      hasError: false,
      isLoading: true,
      isSuccess: false,
      error: '',
      user: const User.init(),
      isSignIn: false,
    );
  }
}
