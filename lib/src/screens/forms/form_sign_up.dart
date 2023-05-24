// import 'package:duty_manager/src/controller/cubit/auth_cubit.dart';
// import 'package:duty_manager/src/screens/components/submit_button_s1.dart';
// import 'package:duty_manager/src/screens/components/text_form_field_s1.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../app_string.dart' as string;
// import '../../controller/cubit/auth_state.dart';

// class FormSignUp extends StatefulWidget {
//   const FormSignUp({super.key});

//   @override
//   State<FormSignUp> createState() => _FormSignUpState();
// }

// class _FormSignUpState extends State<FormSignUp> {
//   final _formKey = GlobalKey<FormState>();

//   final _usernameController = TextEditingController();
//   final _emailController = TextEditingController();

//   @override
//   void initState() {
//     _usernameController.addListener(() {
//       _usernameChangeHandler(_usernameController.text);
//     });
//     _emailController.addListener(() {
//       _emailOnChangeHandler(_emailController.text);
//     });

//     super.initState();
//   }

//   @override
//   void dispose() {
//     _usernameController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }

//   void _submitHandler(BuildContext context) {
//     final state = _formKey.currentState;

//     if (state?.validate() == true) {
//       state?.save();
//       context.read<AuthenticationBloc>().signUp();
//     }
//   }

//   void _usernameChangeHandler(String? value) {
//     context.read<AuthenticationBloc>().setUserName(value);
//     context.read<AuthenticationBloc>().checkIfUserExist();
//   }

//   void _emailOnChangeHandler(String? value) {
//     context.read<AuthenticationBloc>().setEmail(value);
//     context.read<AuthenticationBloc>().checkEmailInUsed();
//   }

//   String? _usernameValidator(String? value, bool? isUserIdExist) {
//     final regexp = RegExp(r'^[a-zA-Z][a-zA-Z0-9_]*$');

//     if (value == null || value.isEmpty) {
//       return "field can't be empty! please Enter something";
//     }
//     if (value.length < 3) {
//       return "field can't be less than 3 character";
//     }
//     if (value.length > 15) {
//       return "field can't be more than 15 character";
//     }
//     if (!regexp.hasMatch(value)) {
//       return "ID should not use special characters except '_' and start with alphabet letters";
//     }
//     if (isUserIdExist == true) {
//       return "User ID/username already taken by another user try another one";
//     }
//     return null;
//   }

//   String? _emailValidator(String? value, bool? isEmailUsed) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter your email';
//     } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
//       return 'Please enter a valid email';
//     }
//     if (isEmailUsed == true) {
//       return "Email used once; If you have a previous account, go to the entry page and log in using username";
//     }
//     return null;
//   }

//   String? _passwordValidator(String? value) {
//     if (value == null || value.isEmpty) {
//       return "field can't be empty! please Enter something";
//     }
//     if (value.length < 8) {
//       return "field can't be less than 8 character";
//     }
//     if (value.length > 28) {
//       return "field can't be more than 28 character";
//     }

//     return null;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final circularProgressIndicator = Container(
//       height: 5,
//       width: 5,
//       margin: const EdgeInsets.all(10),
//       child: const CircularProgressIndicator.adaptive(),
//     );
//     var checkIcon = Icon(
//       Icons.check_circle,
//       size: 20,
//       color: theme.primaryColor,
//     );
//     final suffixIcon = BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       buildWhen: (previous, current) {
//         final build = previous.isCheckedUserID != current.isCheckedUserID ||
//             previous.isCheckingUserID != current.isCheckingUserID ||
//             previous.isCheckingUserIDFaild != current.isCheckingUserIDFaild ||
//             previous.isUserIDExist != current.isUserIDExist;
//         return build;
//       },
//       builder: (context, state) {
//         if (state.isCheckingUserID == true) {
//           return circularProgressIndicator;
//         }
//         if (_usernameController.text.length > 2 &&
//             state.isUserIDExist == false) {
//           return checkIcon;
//         } else {
//           return const SizedBox();
//         }
//       },
//     );
//     final suffixIconeEmail =
//         BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       buildWhen: (previous, current) {
//         final build = previous.isCheckedEmail != current.isCheckedEmail ||
//             previous.isCheckingEmail != current.isCheckingEmail ||
//             previous.isCheckingEmailFaild != current.isCheckingEmailFaild ||
//             previous.isEmailUsed != current.isEmailUsed;
//         return build;
//       },
//       builder: (context, state) {
//         if (state.isCheckingEmail == true) {
//           return circularProgressIndicator;
//         }
//         if (state.isEmailUsed == false) {
//           return checkIcon;
//         } else {
//           return const SizedBox();
//         }
//       },
//     );
//     final usernameFeild = BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       buildWhen: (previous, current) {
//         return current.isUserIDExist != previous.isUserIDExist;
//       },
//       builder: (context, state) {
//         return S1TextFromField(
//           controller: _usernameController,
//           suffixIcon: suffixIcon,
//           validator: (v) => _usernameValidator(v, state.isUserIDExist),
//           textInputAction: TextInputAction.next,
//           label: string.signUpUsernameFieldLabel,
//           hintText: string.signUpUsernameFieldHint,
//         );
//       },
//     );
//     final emailFeild = BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       buildWhen: (previous, current) {
//         return current.isEmailUsed != previous.isEmailUsed;
//       },
//       builder: (context, state) {
//         return S1TextFromField(
//           controller: _emailController,
//           validator: (v) => _emailValidator(v, state.isEmailUsed),
//           suffixIcon: suffixIconeEmail,
//           textInputAction: TextInputAction.next,
//           keyboardType: TextInputType.emailAddress,
//           label: string.signUpEmailFieldLabel,
//           hintText: string.signUpEmailFieldHint,
//         );
//       },
//     );
//     final passwordFeild = S1TextFromField(
//       validator: _passwordValidator,
//       textInputAction: TextInputAction.done,
//       label: string.signUpPasswordFieldLabel,
//       keyboardType: TextInputType.visiblePassword,
//       hintText: string.signUpPasswordFieldHint,
//       onSaved: context.read<AuthenticationBloc>().setPassword,
//       obscureText: true,
//     );
//     final submitBtn = BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       builder: (context, state) {
//         final submit =
//             state.isUserIDExist == false && state.isEmailUsed == false
//                 ? () => _submitHandler(context)
//                 : null;
//         return S1SubmitButton(
//           text: string.authSubmitBtn,
//           onSubmit: submit,
//         );
//       },
//     );
//     return Form(
//       key: _formKey,
//       child: Column(
//         children: [
//           usernameFeild,
//           emailFeild,
//           passwordFeild,
//           const SizedBox(height: 20),
//           submitBtn,
//           const SizedBox(height: 30)
//         ],
//       ),
//     );
//   }
// }
