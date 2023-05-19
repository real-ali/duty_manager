import 'package:duty_manager/src/controller/cubit/auth_cubit.dart';
import 'package:duty_manager/src/screens/components/submit_button_s1.dart';
import 'package:duty_manager/src/screens/screen_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/app_string.dart' as string;
import '../../controller/cubit/auth_state.dart';
import '../components/check_box_s1.dart';
import '../components/text_form_field_s1.dart';

class SystemEnteringForm extends StatefulWidget {
  const SystemEnteringForm({
    super.key,
  });

  @override
  State<SystemEnteringForm> createState() => _SystemEnteringFormState();
}

class _SystemEnteringFormState extends State<SystemEnteringForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _value = '';
  String? _password;
  bool? _isLocal;

  void setValuesAsLocal() {
    if (_value?.startsWith("@") == true) {
      context.read<AuthenticationBloc>().setUserName(_value?.substring(1));
    } else {
      context.read<AuthenticationBloc>().setName(_value);
    }
    context.read<AuthenticationBloc>().setPassword(_password);
    context.read<AuthenticationBloc>().setIsLocal(_isLocal);
    context.read<AuthenticationBloc>().enterToSystem();
  }

  void _submit(BuildContext context) {
    final state = _formKey.currentState;

    if (state?.validate() == true && _isLocal == true) {
      setValuesAsLocal();
    } else if (state?.validate() == true && _isLocal != false) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) {
          return ScreenAuth(
            name: _value ?? '',
          );
        },
      ));
    }
  }

  String? _validator(String? value) {
    final regexp = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]*$');
    if (value == null || value.isEmpty) {
      return "field can't be empty! please Enter something";
    }
    if (value.length < 3) {
      return "field can't be less than 3 character";
    }
    if (value.length > 15) {
      return "field can't be more than 15 character";
    }
    if (value.startsWith("@") && !regexp.hasMatch(value.substring(1))) {
      return "ID should not use special characters except '_' and start with alphabet letters";
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return "field can't be empty! please Enter something";
    }
    if (value.length < 8) {
      return "field can't be less than 8 character";
    }
    if (value.length > 28) {
      return "field can't be more than 28 character";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final Widget textField = S1TextFromField(
      label: string.authTextFieldLabel,
      validator: _validator,
      hintText: string.authTextFieldHint,
      onChanged: (value) => setState(() => _value = value),
    );
    final Widget passWordField = S1TextFromField(
      obscureText: true,
      margin: const EdgeInsets.only(top: 10, bottom: 20),
      label: string.authPasswordFieldLabel,
      validator: _passwordValidator,
      hintText: string.authPasswordFieldHint,
      onChanged: (value) => setState(() => _password = value),
    );
    final checkBox = BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        return S1CheckBox(
          text: string.authCheckBoxText,
          message: string.authCheckBoxMessage,
          value: _isLocal,
          onChanged: (value) => setState(() => _isLocal = value),
        );
      },
    );
    final s1submitButton = S1SubmitButton(
      text: string.authSubmitBtn,
      onSubmit: () => _submit(context),
    );
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          textField,
          _value!.startsWith("@") ? passWordField : checkBox,
          s1submitButton,
        ],
      ),
    );
  }
}
