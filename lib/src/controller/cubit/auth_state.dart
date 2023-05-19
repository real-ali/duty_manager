import '../../models/user.dart';

class AuthenticationState {
  final bool isLacal;
  final bool hasError;
  final bool isLoading;
  final bool isSuccess;
  final bool isSignIn;
  final String error;
  final AppUser user;

  AuthenticationState({
    required this.isLacal,
    required this.hasError,
    required this.isLoading,
    required this.isSuccess,
    required this.error,
    required this.user,
    required this.isSignIn,
  });
  AuthenticationState.init({
    this.isLacal = false,
    this.hasError = false,
    this.isLoading = false,
    this.isSuccess = false,
    this.error = '',
    this.user = const AppUser.init(),
    this.isSignIn = false,
  });

  AuthenticationState copyWith({
    bool? isLacal,
    bool? hasError,
    bool? isLoading,
    bool? isSuccess,
    bool? isSignIn,
    String? error,
    AppUser? user,
  }) {
    return AuthenticationState(
      isLacal: isLacal ?? this.isLacal,
      hasError: hasError ?? this.hasError,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      user: user ?? this.user,
      isSignIn: isSignIn ?? this.isSignIn,
    );
  }

  AuthenticationState errorState(String err) {
    return AuthenticationState(
      isLacal: isLacal,
      hasError: true,
      isLoading: false,
      isSuccess: false,
      error: err,
      user: user,
      isSignIn: false,
    );
  }

  AuthenticationState successState({bool? isSignedIn, AppUser? user}) {
    return AuthenticationState(
      isLacal: isLacal,
      hasError: false,
      isLoading: false,
      isSuccess: true,
      error: '',
      user: user ?? this.user,
      isSignIn: isSignedIn ?? isSignIn,
    );
  }

  AuthenticationState loadingState() {
    return AuthenticationState(
      isLacal: isLacal,
      hasError: false,
      isLoading: true,
      isSuccess: false,
      error: '',
      user: user,
      isSignIn: false,
    );
  }
}
