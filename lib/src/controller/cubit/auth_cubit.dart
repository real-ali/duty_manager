import 'dart:async';

import 'package:duty_manager/src/options/local/local_options_auth.dart';
import 'package:duty_manager/src/options/online/online_options_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/user.dart';
import 'auth_state.dart';

class AuthenticationBloc extends Cubit<AuthenticationState> {
  final LocalOptionsAuth _options;
  final OnlineOptionsAuth _onlineOptions;
  AuthenticationBloc({
    required LocalOptionsAuth options,
    required OnlineOptionsAuth onlineOptions,
  })  : _options = options,
        _onlineOptions = onlineOptions,
        super(AuthenticationState.init()) {
    fetchLocalSetting();
    fetchData();
  }

  void setIsLocal(bool? isLocal) {
    emit(state.copyWith(isLacal: isLocal));
  }

  void setPassword(String? password) {
    emit(state.copyWith(user: state.user.copyWith(password: password)));
  }

  void setName(String? name) {
    emit(state.copyWith(user: state.user.copyWith(name: name)));
  }

  void setEmail(String? email) {
    emit(state.copyWith(user: state.user.copyWith(email: email)));
  }

  void setUserName(String? userName) {
    final user = state.user.copyWith(userName: userName);

    emit(state.copyWith(user: user));
  }

  void signInWithGoogle() async {
    try {
      emit(state.fetchingState());
      await _onlineOptions.signInWithGoogle();
      emit(state.fetchedState());
    } catch (e) {
      emit(state.fetchingFaildState(err: '$e'));
    }
  }

  void signInWithTwitter() async {
    try {
      emit(state.fetchingState());
      await _onlineOptions.signInWithTwitter();
      emit(state.fetchedState());
    } catch (e) {
      emit(state.fetchingFaildState(err: '$e'));
    }
  }

  void signOut() async {
    try {
      emit(state.fetchingState());
      await _onlineOptions.signOut();
      emit(state.fetchedState());
    } catch (e) {
      emit(state.fetchingFaildState(err: '$e'));
    }
  }

  void enterToSystem() async {
    try {
      emit(state.fetchingState());
      final data = state.user;
      await _options.enteringToSystem(data, state.isLocal);
      emit(state.fetchedState());
    } catch (e) {
      emit(state.fetchingFaildState(err: "$e"));
    }
  }

  void logout() async {
    try {
      emit(state.clearingState());
      await _options.clearAll();
      emit(state.clearedState());
    } catch (e) {
      emit(state.clearingFaildState(
          err: "An error occurred! Please try again."));
    }
  }

  StreamSubscription<Map<String, dynamic>?>? _streamSubscriptio;
  fetchData() async {
    _streamSubscriptio?.cancel();
    _streamSubscriptio = _options.fetchUserData().listen((event) {
      emit(state.fetchingState());

      final hasdata = event?['data'] != null;

      emit(state.fetchedState().copyWith(
            isSignedIn: hasdata,
            user: AppUser.fromJson(event),
          ));
    }, onError: (e) {
      emit(state.fetchingFaildState(err: e));
    });
  }

  fetchLocalSetting() async {
    _streamSubscriptio?.cancel();
    _streamSubscriptio = _options.fetchLocalSetting().listen((event) {
      emit(state.fetchedState().copyWith(
            isLacal: event['is_local'],
          ));
    }, onError: (e) {
      emit(state.fetchingFaildState(err: e));
    });
  }

  @override
  Future<void> close() {
    _streamSubscriptio?.cancel();
    return super.close();
  }
}
