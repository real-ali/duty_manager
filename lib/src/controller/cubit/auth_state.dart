import '../../models/user.dart';

class AuthenticationState {
  final bool isLocal;
  final AppUser user;
  final bool isSignedIn;
  final String? statesError;

  final bool? isfetching;
  final bool? isFetchingFaild;

  final bool? isFetched;

  final bool? isUploading;
  final bool? isUploadingFaild;

  final bool? isUploaded;

  final bool? isClearing;
  final bool? isClearingFaild;

  final bool? isCleared;

  final bool? isCheckingUserID;
  final bool? isCheckingUserIDFaild;

  final bool? isCheckedUserID;
  final bool? isUserIDExist;

  final bool? isCheckingEmail;
  final bool? isCheckingEmailFaild;

  final bool? isCheckedEmail;
  final bool? isEmailUsed;

  AuthenticationState({
    required this.isLocal,
    required this.isfetching,
    required this.isFetchingFaild,
    required this.statesError,
    required this.isFetched,
    required this.isUploading,
    required this.isUploadingFaild,
    required this.isUploaded,
    required this.user,
    required this.isClearing,
    required this.isClearingFaild,
    required this.isCleared,
    required this.isCheckingUserID,
    required this.isCheckingUserIDFaild,
    required this.isCheckedUserID,
    required this.isUserIDExist,
    required this.isSignedIn,
    required this.isEmailUsed,
    required this.isCheckingEmail,
    required this.isCheckingEmailFaild,
    required this.isCheckedEmail,
  });
  AuthenticationState.init({
    this.isLocal = false,
    this.isfetching,
    this.isFetchingFaild,
    this.statesError,
    this.isFetched,
    this.isUploading,
    this.isUploadingFaild,
    this.isUploaded,
    this.isClearing,
    this.isClearingFaild,
    this.isCleared,
    this.isCheckingUserID,
    this.isCheckingUserIDFaild,
    this.isCheckedUserID,
    this.isUserIDExist,
    this.isCheckingEmail,
    this.isCheckingEmailFaild,
    this.isCheckedEmail,
    this.isSignedIn = false,
    this.isEmailUsed,
    this.user = const AppUser.init(),
  });

  AuthenticationState copyWith({
    String? statesError,
    bool? isLacal,
    bool? isfetching,
    bool? isFetchingFaild,
    bool? isFetched,
    bool? isUploading,
    bool? isUploadingFaild,
    bool? isUploaded,
    bool? isClearing,
    bool? isClearingFaild,
    bool? isCleared,
    bool? isCheckingUserID,
    bool? isCheckingUserIDFaild,
    bool? isCheckedUserID,
    bool? isUserIDExist,
    bool? isSignedIn,
    bool? isEmailUsed,
    bool? isCheckingEmail,
    bool? isCheckingEmailFaild,
    bool? isCheckedEmail,
    AppUser? user,
  }) {
    return AuthenticationState(
      isLocal: isLacal ?? isLocal,
      statesError: statesError ?? this.statesError,
      isfetching: isfetching ?? this.isfetching,
      isFetchingFaild: isFetchingFaild ?? this.isFetchingFaild,
      isFetched: isFetched ?? this.isFetched,
      isUploading: isUploading ?? this.isUploading,
      isUploadingFaild: isUploadingFaild ?? this.isUploadingFaild,
      isUploaded: isUploaded ?? this.isUploaded,
      isClearing: isClearing ?? this.isClearing,
      isClearingFaild: isClearingFaild ?? this.isClearingFaild,
      isCleared: isCleared ?? this.isCleared,
      isCheckingUserID: isCheckingUserID ?? this.isCheckingUserID,
      isCheckingUserIDFaild:
          isCheckingUserIDFaild ?? this.isCheckingUserIDFaild,
      isCheckedUserID: isCheckedUserID ?? this.isCheckedUserID,
      isSignedIn: isSignedIn ?? this.isSignedIn,
      isUserIDExist: isUserIDExist ?? this.isUserIDExist,
      isEmailUsed: isEmailUsed ?? this.isEmailUsed,
      user: user ?? this.user,
      isCheckedEmail: isCheckedEmail ?? this.isCheckedEmail,
      isCheckingEmail: isCheckingEmail ?? this.isCheckingEmail,
      isCheckingEmailFaild: isCheckingEmailFaild ?? this.isCheckingEmailFaild,
    );
  }

  AuthenticationState fetchingState() {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isfetching: true,
      isFetched: false,
      isFetchingFaild: false,
      statesError: '',
    );
  }

  AuthenticationState fetchingFaildState({String? err}) {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isfetching: false,
      isFetched: false,
      isFetchingFaild: true,
      statesError: err,
    );
  }

  AuthenticationState fetchedState() {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isfetching: false,
      isFetched: true,
      isFetchingFaild: false,
      statesError: '',
    );
  }

  AuthenticationState uploadingState() {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isUploading: true,
      isUploaded: false,
      isUploadingFaild: false,
      statesError: '',
    );
  }

  AuthenticationState uploadingFaildState({String? err}) {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isUploading: false,
      isUploaded: false,
      isUploadingFaild: true,
      statesError: err,
    );
  }

  AuthenticationState uploadedState() {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isUploading: false,
      isUploaded: true,
      isUploadingFaild: false,
      statesError: '',
    );
  }

  AuthenticationState clearingState() {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isClearing: true,
      isCleared: false,
      isClearingFaild: false,
      statesError: '',
    );
  }

  AuthenticationState clearingFaildState({String? err}) {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isClearing: false,
      isCleared: false,
      isClearingFaild: true,
      statesError: err,
    );
  }

  AuthenticationState clearedState() {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isClearing: false,
      isCleared: true,
      isClearingFaild: false,
      statesError: '',
    );
  }

  AuthenticationState checkingUserIDState() {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isCheckingUserID: true,
      isCheckedUserID: false,
      isCheckingUserIDFaild: false,
      statesError: '',
    );
  }

  AuthenticationState checkingUserIDFaildState({String? err}) {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isCheckingUserID: false,
      isCheckedUserID: false,
      isCheckingUserIDFaild: true,
      statesError: err,
    );
  }

  AuthenticationState checkedUserIDState(bool? isUserIDExist) {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isEmailUsed: isEmailUsed,
      isCheckingUserID: false,
      isCheckedUserID: true,
      isCheckingUserIDFaild: false,
      isUserIDExist: isUserIDExist ?? this.isUserIDExist,
      statesError: '',
    );
  }

  AuthenticationState checkingEmailState() {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isCheckingUserID: isCheckingUserID,
      isCheckedUserID: isCheckedUserID,
      isCheckingUserIDFaild: isCheckingUserIDFaild,
      isUserIDExist: isUserIDExist,
      isCheckingEmail: true,
      isCheckedEmail: false,
      isCheckingEmailFaild: false,
      statesError: '',
    );
  }

  AuthenticationState checkingEmailFaildState({String? err}) {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isCheckingUserID: isCheckingUserID,
      isCheckedUserID: isCheckedUserID,
      isCheckingUserIDFaild: isCheckingUserIDFaild,
      isUserIDExist: isUserIDExist,
      isCheckingEmail: false,
      isCheckedEmail: false,
      isCheckingEmailFaild: true,
      statesError: err,
    );
  }

  AuthenticationState checkedEmailState(bool? isEmailUsed) {
    return AuthenticationState.init(
      isLocal: isLocal,
      user: user,
      isSignedIn: isSignedIn,
      isCheckingUserID: isCheckingUserID,
      isCheckedUserID: isCheckedUserID,
      isCheckingUserIDFaild: isCheckingUserIDFaild,
      isUserIDExist: isUserIDExist,
      isCheckingEmail: false,
      isCheckedEmail: true,
      isCheckingEmailFaild: true,
      isEmailUsed: isEmailUsed ?? this.isEmailUsed,
      statesError: '',
    );
  }
}
