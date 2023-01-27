import 'package:duty_manager/src/data/local_db.dart';
import 'package:duty_manager/src/models/user.dart';
import 'package:duty_manager/src/options/options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

part 'sign_in_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.init());

  void activeLocal(bool? isActive) {
    emit(state.copyWith(isLacal: isActive));
  }

  Options get _options {
    if (state.isLacal) return LocalDb();
    return LocalDb();
  }

  void setName(String? name) {
    emit(state.copyWith(user: state.user.copyWith(name: name)));
    print(state.user.id);
  }

  void signin() async {
    String uuid = const Uuid().v1();
    emit(state.loadingState());
    try {
      final user = state.user.copyWith(id: uuid);
      final result = await _options.signIn(user);
      emit(state.successState(isSignedIn: result));
    } catch (e) {
      emit(state.errorState('$e'));
    }
  }
}
