import 'dart:async';

import 'package:duty_manager/src/logic/supabase/logic_supabase_authentication.dart';
import 'package:duty_manager/src/options/options_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'auth_state.dart';

class AuthenticationBloc extends Cubit<AuthenticationState> {
  final OptionsAuth _options;
  final LogicSupabaseAuthentication _supabaseAuthentication;
  AuthenticationBloc({
    required OptionsAuth options,
    required LogicSupabaseAuthentication supabaseAuthentication,
  })  : _options = options,
        _supabaseAuthentication = supabaseAuthentication,
        super(AuthenticationState.init()) {
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

  void setUserName(String? userName) {
    emit(state.copyWith(user: state.user.copyWith(userName: userName)));
  }

  Future<bool> checkIfUserExist() async {
    emit(state.loadingState());
    return true;
  }

  void enterToSystem() async {
    try {
      emit(state.loadingState());
      final data = state.user.copyWith(id: const Uuid().v4());
      await _options.enteringToSystem(data);
      emit(state.successState());
    } catch (e) {
      emit(state.errorState('$e'));
    }
  }

  void logout() async {
    try {
      emit(state.loadingState());
      await _options.clearAll();
      emit(state.successState());
    } catch (e) {
      emit(state.errorState("An error occurred! Please try again."));
    }
  }

  StreamSubscription<Map<String, dynamic>?>? _streamSubscriptio;

  fetchData() async {
    // _streamSubscriptio?.cancel();
    _streamSubscriptio = _options.currentUserData().listen((event) {
      if (event == null || event.isEmpty) {
        emit(state.successState(isSignedIn: false));
      } else {
        emit(
          state.successState(isSignedIn: true),
        );
      }
    }, onError: (e) {
      emit(state.errorState(e.toString()));
    });
  }

  @override
  Future<void> close() {
    _streamSubscriptio?.cancel();
    return super.close();
  }
}
