import 'package:duty_manager/src/controller/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      color: Colors.orange,
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
                          'png/logo.png',
                          color: Colors.white,
                          width: 150,
                        ),
                        const Text("Duty Manager",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)
                            // Theme.of(context).textTheme.headline5!.copyWith(
                            //       color: Colors.white,
                            //       fontWeight: FontWeight.bold,
                            //     ),
                            )
                      ],
                    ),
                  )),
              Flexible(flex: 3, child: Container())
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