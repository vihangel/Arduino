// import 'package:flutter/material.dart';
// import 'package:flutter_modular/flutter_modular.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// import 'package:validatorless/validatorless.dart';

// import '../../shared/resources/colors.dart';
// import '../../shared/widget/text_form_field_widget.dart';
// import 'controller/login_controller.dart';

// class LoginPage extends StatelessWidget {
//   final LoginController controller;
//   LoginPage({Key? key, required this.controller}) : super(key: key);

//   final formKey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Container(
//           width: size.width,
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Color.fromARGB(255, 39, 75, 166),
//                 Color.fromARGB(255, 56, 83, 240),
//               ],
//             ),
//           ),
//           child: SafeArea(
//             child: Flex(
//               direction: Axis.vertical,
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Flexible(
//                   flex: 2,
//                   child: Center(
//                     child: Align(
//                       alignment: Alignment.centerLeft,
//                       child: Padding(
//                         padding: const EdgeInsets.symmetric(horizontal: 40),
//                         child: RichText(
//                           text: const TextSpan(
//                             children: <TextSpan>[
//                               TextSpan(
//                                 text: "Oieee \n",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 30,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: "Seja bem vinde!",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 24,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 Flexible(
//                   flex: 8,
//                   child: Container(
//                     decoration: const BoxDecoration(
//                         borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(50),
//                             topRight: Radius.circular(50)),
//                         color: Colors.white),
//                     padding: const EdgeInsets.all(40),
//                     width: size.width,
//                     height: size.height,
//                     child: Form(
//                         key: formKey,
//                         child: Flex(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           direction: Axis.vertical,
//                           children: [
//                             Flexible(
//                               flex: 10,
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceAround,
//                                 children: [
//                                   const Text(
//                                     "Login",
//                                     style: TextStyle(
//                                       color: ColorsApp.primary,
//                                       fontSize: 30,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   // TextFormFieldWidget(
//                                   //   title: 'Email',
//                                   //   validator: Validatorless.multiple([
//                                   //     Validatorless.email(
//                                   //         'Digite um email válido'),
//                                   //     Validatorless.required(
//                                   //         'Este campo é obrigatório')
//                                   //   ]),
//                                   // ),
//                                   // Column(
//                                   //   children: [
//                                   //     TextFormFieldWidget(
//                                   //       title: 'Senha',
//                                   //       icon: IconButton(
//                                   //         icon: const Icon(
//                                   //           Icons.remove_red_eye,
//                                   //         ),
//                                   //         onPressed: () {},
//                                   //       ),
//                                   //       obscureText: true,
//                                   //     ),
//                                   //     Align(
//                                   //       alignment: Alignment.centerRight,
//                                   //       child: TextButton(
//                                   //         style: TextButton.styleFrom(
//                                   //           padding: const EdgeInsets.only(
//                                   //               right: 15),
//                                   //         ),
//                                   //         onPressed: () {},
//                                   //         child: const Text(
//                                   //           "Esqueci a senha",
//                                   //           style: TextStyle(
//                                   //             color: ColorsApp.primary,
//                                   //             fontSize: 14,
//                                   //           ),
//                                   //         ),
//                                   //       ),
//                                   //     ),
//                                   //   ],
//                                   // ),
//                                   // SizedBox(
//                                   //   width: size.width,
//                                   //   child: ElevatedButton(
//                                   //     onPressed: () {
//                                   //       if (!formKey.currentState!
//                                   //           .validate()) {}
//                                   //     },
//                                   //     child: const Text(
//                                   //       "Entrar",
//                                   //     ),
//                                   //   ),
//                                   // ),
//                                 ],
//                               ),
//                             ),
//                             Flexible(
//                               flex: 2,
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Container(
//                                     color: ColorsApp.primary,
//                                     height: 1,
//                                     width: size.width * 0.3,
//                                   ),
//                                   const Text(
//                                     "ou",
//                                     style: TextStyle(
//                                       color: ColorsApp.primary,
//                                       fontSize: 18,
//                                     ),
//                                   ),
//                                   Container(
//                                     color: ColorsApp.primary,
//                                     height: 1,
//                                     width: size.width * 0.3,
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             Flexible(
//                               flex: 1,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   IconButton(
//                                     onPressed: () {
//                                       controller.signIn();
//                                     },
//                                     icon: const Icon(FontAwesomeIcons.google),
//                                     color: ColorsApp.primary,
//                                   ),
//                                   // IconButton(
//                                   //     onPressed: () {
//                                   //       Modular.to.navigate("/home/");
//                                   //     },
//                                   //     icon: const Icon(
//                                   //         Icons.circle_notifications)),
//                                   // IconButton(
//                                   //     onPressed: () {},
//                                   //     icon: const Icon(
//                                   //         Icons.circle_notifications)),
//                                 ],
//                               ),
//                             ),
//                             Flexible(
//                               flex: 2,
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   // TextButton(
//                                   //     onPressed: () {},
//                                   //     child: const Text(
//                                   //       "Criar conta",
//                                   //       style: TextStyle(
//                                   //         color: ColorsApp.primary,
//                                   //         fontSize: 14,
//                                   //         fontWeight: FontWeight.bold,
//                                   //       ),
//                                   //     )),
//                                   // Container(
//                                   //   color: ColorsApp.primary,
//                                   //   height: 10,
//                                   //   width: 1,
//                                   // ),
//                                   TextButton(
//                                       onPressed: () {},
//                                       child: const Text(
//                                         "Reportar",
//                                         style: const TextStyle(
//                                           color: ColorsApp.primary,
//                                           fontSize: 14,
//                                         ),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                           ],
//                         )),
//                   ),
//                 ),
//               ],

//               //  Image.asset('assets/images/logo.png'),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
