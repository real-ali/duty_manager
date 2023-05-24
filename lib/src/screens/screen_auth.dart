// import 'package:duty_manager/src/screens/components/hyper_link_text.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// import '../../app_png.dart' as png;
// import '../../app_string.dart' as string;
// import '../../constraints.dart' as size;
// import '../controller/cubit/auth_cubit.dart';
// import '../controller/cubit/auth_state.dart';
// import 'components/typing_animation.dart';
// import 'forms/form_sign_up.dart';
// import 'screen_about_app.dart';

// class ScreenAuth extends StatefulWidget {
//   static const String path = '/authentication';

//   const ScreenAuth({super.key});

//   @override
//   State<ScreenAuth> createState() => _ScreenAuthState();
// }

// class _ScreenAuthState extends State<ScreenAuth> {
//   @override
//   Widget build(BuildContext context) {
//     final isSmallScreen = size.isSmallSize(context);
//     final theme = Theme.of(context);
//     final logoPic = Image.asset(
//       png.robot,
//       width: 110,
//     );

//     var appBar = AppBar(
//       leadingWidth: 30,
//       elevation: 0,
//       centerTitle: false,
//       backgroundColor: theme.primaryColor,
//       title: const Text("Entering the System"),
//     );
//     final header = BlocBuilder<AuthenticationBloc, AuthenticationState>(
//       buildWhen: (previous, current) {
//         return previous.user.name != current.user.name;
//       },
//       builder: (context, state) {
//         return Container(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               AnimatedTypingText(
//                 text: string.signUpMessage(state.user.name.toUpperCase()),
//                 textStyle: theme.textTheme.titleLarge?.copyWith(
//                   fontWeight: FontWeight.w900,
//                   fontSize: 22,
//                 ),
//                 hyperTextStyle: theme.textTheme.titleLarge?.copyWith(
//                   fontWeight: FontWeight.w900,
//                   color: theme.primaryColor,
//                   fontSize: 24,
//                 ),
//                 hypers: [
//                   Hyper("Duty Manager", () {
//                     context.push(ScreenAboutApp.path);
//                   }),
//                 ],
//                 nextText: AnimatedTypingText(
//                   text: string.signUpMessage1,
//                   textStyle: theme.textTheme.titleSmall,
//                 ),
//               ),
//               const SizedBox(height: 10),
//               Text(
//                 string.signUpMessage2,
//                 style: theme.textTheme.titleMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );

//     return Scaffold(
//       appBar: appBar,
//       body: Center(
//         child: Container(
//           constraints: const BoxConstraints(maxWidth: 1000),
//           padding: const EdgeInsets.all(10),
//           child: SingleChildScrollView(
//             physics: const BouncingScrollPhysics(),
//             child: Column(
//               children: [
//                 Flex(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
//                   children: [
//                     logoPic,
//                     header,
//                   ],
//                 ),
//                 FormSignUp(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
