import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pega_pega/app/modules/home/controller/home_controller.dart';

HomeController controller = Modular.get<HomeController>();

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        controller.signOut();
      },
      child: const Text("Sair"),
    );
  }
}
