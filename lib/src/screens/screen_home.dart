import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../controller/cubit/auth_cubit.dart';
import '../controller/cubit/auth_state.dart';

class HomeScreen extends StatelessWidget {
  static const String path = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Hello",
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
                Text(
                  state.user.name,
                  style: const TextStyle(
                    color: Colors.red,
                  ),
                ),
                Text("@${state.user.userName}"),
                TextButton(
                    onPressed: () {
                      context.read<AuthenticationBloc>().logout();
                      context.go('/e');
                      print("click");
                    },
                    child: const Text("Logout"))
              ],
            ),
          ),
        );
      },
    );
  }
}
