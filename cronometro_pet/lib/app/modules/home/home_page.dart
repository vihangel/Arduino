import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../shared/resources/colors.dart';
import '../login/controller/login_controller.dart';
import 'controller/home_controller.dart';

HomeController controller = Modular.get<HomeController>();

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Observer(builder: (context) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          selectedItemColor: ColorsApp.primary,
          unselectedItemColor: Colors.grey[400],
          currentIndex: controller.currentIndex,
          onTap: controller.updateIndex,
          items: const [
            BottomNavigationBarItem(
              activeIcon: Icon(FontAwesomeIcons.solidCircleUser),
              label: "Perfil",
              icon: Icon(FontAwesomeIcons.circleUser),
            ),
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(FontAwesomeIcons.clock),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(FontAwesomeIcons.clockRotateLeft),
              label: "Historico",
              icon: Icon(FontAwesomeIcons.clockRotateLeft),
            ),
            //Colocaar o rostinho da pessoa
          ],
        ),
        body: SafeArea(
          child: GestureDetector(
              // onTap: () => controller.signOut(),
              child: controller.pages[controller.currentIndex]),
        ),
      );
    });
  }
}
