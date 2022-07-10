import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../services/auth/auth_service.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () {
        FirebaseAuth.instance.authStateChanges().listen((user) {
          if (user != null) {
            Modular.to.navigate('/home/');
          } else {
            Modular.to.navigate('/login/');
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0XFFFF7272),
              Color(0XFFFFA95A),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            "PEGA PEGA",
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          //  Image.asset('assets/images/logo.png'),
        ),
      ),
    );
  }
}
