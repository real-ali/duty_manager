import 'package:device_preview/device_preview.dart';
import 'package:duty_manager/application_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'src/controller/cubit/sign_in_cubit.dart';
import 'src/screens/screen_home.dart';
import 'src/screens/screen_sign_in.dart';

void main() {
  runApp(DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) {
      return const DutyManager();
    },
  ));
}

class DutyManager extends StatelessWidget {
  const DutyManager({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SignInCubit>(
          create: (context) => SignInCubit(),
        )
      ],
      child: BlocBuilder<SignInCubit, SignInState>(
        builder: (context, state) {
          final homePage =
              state.isSignIn ? const HomeScreen() : const SignInScreen();
          return buildApplication(context, homePage);
        },
      ),
    );
  }

  MaterialApp buildApplication(BuildContext context, Widget homePage,
      [SignInState? state]) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Lato').copyWith(primaryColor: lightColor1),
      darkTheme: ThemeData.dark().copyWith(primaryColor: darkColor1),
      themeMode: ThemeMode.system,
      home: homePage,
    );
  }
}
