part of 'sign_in_cubit.dart';

class AuthState {
  final bool isLacal;
  final bool hasError;
  final bool isLoading;
  final bool isSuccess;
  final bool isSignIn;
  final String error;
  final User user;

  AuthState({
    required this.isLacal,
    required this.hasError,
    required this.isLoading,
    required this.isSuccess,
    required this.error,
    required this.user,
    required this.isSignIn,
  });
  AuthState.init({
    this.isLacal = false,
    this.hasError = false,
    this.isLoading = false,
    this.isSuccess = false,
    this.error = '',
    this.user = const User.init(),
    this.isSignIn = false,
  });

  AuthState copyWith({
    bool? isLacal,
    bool? hasError,
    bool? isLoading,
    bool? isSuccess,
    bool? isSignIn,
    String? error,
    User? user,
  }) {
    return AuthState(
      isLacal: isLacal ?? this.isLacal,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      user: user ?? this.user,
      isSignIn: isSignIn ?? this.isSignIn,
    );
  }

  AuthState errorState(String err) {
    return AuthState(
      isLacal: isLacal,
      hasError: true,
      isLoading: false,
      isSuccess: false,
      error: err,
      user: const User.init(),
      isSignIn: false,
    );
  }

  AuthState successState({bool? isSignedIn}) {
    return AuthState(
      isLacal: isLacal,
      hasError: false,
      isLoading: false,
      isSuccess: true,
      error: '',
      user: user,
      isSignIn: isSignedIn ?? isSignIn,
    );
  }

  AuthState loadingState() {
    return AuthState(
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
