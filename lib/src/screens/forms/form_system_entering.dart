import 'package:duty_manager/src/controller/cubit/sign_in_cubit.dart';
import 'package:duty_manager/src/screens/components/submit_button_s1.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/app_string.dart' as string;
import '../components/check_box_s1.dart';
import '../components/text_form_field_s1.dart';

class SystemEnteringForm extends StatelessWidget {
  SystemEnteringForm({
    super.key,
  });
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submit(BuildContext context) {
    final state = _formKey.currentState;
    if (state?.validate() == true) {
      state?.save();

      context.read<AuthCubit>().signin();
      print("saved");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            S1TextFromField(
              label: string.authTextFieldLabel,
              hintText: string.authTextFieldHint,
              onSaved: context.read<AuthCubit>().setName,
            ),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return S1CheckBox(
                  text: string.authCheckBoxText,
                  value: state.isLacal,
                  onChanged: context.read<AuthCubit>().activeLocal,
                );
              },
            ),
            S1SubmitButton(
              onSubmit: () => _submit(context),
              text: string.authSubmitBtn,
            )
          ],
        ));
  }
}
