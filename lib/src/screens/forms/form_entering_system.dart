import 'package:duty_manager/src/screens/components/text_form_field_s1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../app_string.dart' as string;
import '../../controller/cubit/auth_cubit.dart';
import '../../controller/cubit/auth_state.dart';
import '../components/check_box_s1.dart';
import '../components/submit_button_s1.dart';

class FormEnteringSystem extends StatelessWidget {
  const FormEnteringSystem({super.key});

  void _submitHandler(BuildContext context) {}

  String? _validator(String? value) {
    final regexp2 = RegExp(r'^[a-zA-Z\s][a-zA-Z\s]*$');

    if (value == null || value.isEmpty) {
      return "field can't be empty! please Enter something";
    }
    final notMatch = !regexp2.hasMatch(value);
    if (value.length < 3) {
      return "field can't be less than 3 character";
    }
    if (value.length > 28) {
      return "field can't be more than 28 character";
    }
    if (!value.startsWith("@") && notMatch) {
      return "Name should not use special characters and numbers";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final nameField = BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return S1TextFromField(
          validator: _validator,
        );
      },
    );
    final checkBox = BlocBuilder<AuthenticationBloc, AuthenticationState>(
      buildWhen: (previous, current) {
        return current.isLocal != previous.isLocal;
      },
      builder: (context, state) {
        return S1CheckBox(
          text: string.authCheckBoxText,
          message: string.authCheckBoxMessage,
          value: state.isLocal,
          onChanged: context.read<AuthenticationBloc>().setIsLocal,
        );
      },
    );
    final submitBtn = BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return S1SubmitButton(
          text: string.authSubmitBtn,
          onSubmit: () => _submitHandler(context),
        );
      },
    );

    final twitterProviderBtn = S1SubmitButton(
      margin: const EdgeInsets.symmetric(vertical: 10),
      backgroundColor: Colors.blue[400],
      onSubmit: context.read<AuthenticationBloc>().signInWithTwitter,
      child: Row(
        children: [
          Image.asset(
            'assets/png/twitter_icon.png',
            color: Colors.white,
          ),
          const SizedBox(width: 10),
          const Text(
            "Continue With Twitter",
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
    final googlProviderBtn = S1SubmitButton(
      margin: const EdgeInsets.only(top: 10),
      backgroundColor: theme.colorScheme.onPrimary,
      onSubmit: context.read<AuthenticationBloc>().signInWithGoogle,
      child: Row(
        children: [
          Image.asset('assets/png/google_icon.png'),
          const SizedBox(width: 10),
          const Text(
            "Continue With Google",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );

    List<Widget> localComponents = [nameField, checkBox, submitBtn];
    List<Widget> components = [googlProviderBtn, twitterProviderBtn, checkBox];

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
      return Form(
          child: Column(
        children: [
          ...state.isLocal ? localComponents : components,
        ],
      ));
    });
  }
}
