import 'package:duty_manager/src/controller/cubit/sign_in_cubit.dart';
import 'package:duty_manager/src/screens/screen_home.dart';
import 'package:duty_manager/src/screens/screen_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const DutyManager());
}

class DutyManager extends StatelessWidget {
  const DutyManager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        final homePage =
            state.isSignIn ? const SignInScreen() : const HomeScreen();
        return buildApplication(homePage);
      },
    );
  }

  MaterialApp buildApplication(Widget homePage, [SignInState? state]) {
    return MaterialApp(
      home: homePage,
    );
  }
}
