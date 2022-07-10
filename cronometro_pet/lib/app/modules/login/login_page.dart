import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:validatorless/validatorless.dart';

import '../../shared/resources/colors.dart';
import '../../shared/widget/text_form_field_widget.dart';
import 'controller/login_controller.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  LoginPage({Key? key, required this.controller}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Container(
          width: size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 39, 75, 166),
                Color.fromARGB(255, 56, 83, 240),
              ],
            ),
          ),
          child: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  flex: 2,
                  child: Center(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        child: RichText(
                          text: const TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: "Oieee \n",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "Seja bem vinde!",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  flex: 8,
                  child: Container(
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50)),
                        color: Colors.white),
                    padding: const EdgeInsets.all(40),
                    width: size.width,
                    height: size.height,
                    child: Form(
                        key: formKey,
                        child: Flex(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          direction: Axis.vertical,
                          children: [
                            Flexible(
                                flex: 2,
                                child: Column(
                                  children: [
                                    Image.asset(
                                      'assets/img/logo_pet.png',
                                      width: 150,
                                    ),
                                    const Text(
                                      "Login",
                                      style: TextStyle(
                                        color: ColorsApp.primary,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )),
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: size.width * 0.7,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        controller.signIn();
                                      },
                                      child: const Icon(
                                        FontAwesomeIcons.google,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              flex: 1,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Reportar",
                                        style: const TextStyle(
                                          color: ColorsApp.primary,
                                          fontSize: 14,
                                        ),
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                ),
              ],

              //  Image.asset('assets/images/logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
