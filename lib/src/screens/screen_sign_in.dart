import 'package:duty_manager/src/controller/cubit/sign_in_cubit.dart';
import 'package:duty_manager/src/screens/forms/form_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isSmallSize = MediaQuery.of(context).size.width < 640;
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return Scaffold(
          body: Flex(
            direction: isSmallSize ? Axis.vertical : Axis.horizontal,
            children: [
              Flexible(
                  flex: isSmallSize ? 2 : 3,
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: theme.primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(isSmallSize ? 0 : 360),
                        topRight: Radius.circular(isSmallSize ? 0 : 100),
                        bottomLeft: Radius.circular(isSmallSize ? 90 : 0),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/png/logo.png',
                          color: theme.scaffoldBackgroundColor,
                          width: 150,
                        ),
                        Text(
                          "Duty Manager",
                          style: theme.textTheme.headline5!.copyWith(
                            color: theme.scaffoldBackgroundColor,
                            fontWeight: FontWeight.bold,
                            //     ),
                          ),
                        )
                      ],
                    ),
                  )),
              Flexible(
                  flex: 3,
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "entering the system",
                          style: theme.textTheme.titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Text(
                            'Specify your ID with the @ prefix to log into the pre-created account Or to create a new account, just enter your NAME without any prefix',
                            style: theme.textTheme.caption,
                          ),
                        ),
                        const SignInForm(),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 40, bottom: 5),
                          child: Text(
                            "version 0.0.1",
                            style: theme.textTheme.caption
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        );
      },
    );
  }
}

//Center(
            // child: SignInForm(state.isSignIn),
          // )