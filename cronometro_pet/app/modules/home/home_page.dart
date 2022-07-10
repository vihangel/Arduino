import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pega_pega/app/modules/home/controller/home_controller.dart';
import 'package:pega_pega/app/modules/home/main/main_controller.dart';
import 'package:pega_pega/app/shared/resources/colors.dart';

import '../login/controller/login_controller.dart';
import 'main/main_page.dart';

HomeController controller = Modular.get<HomeController>();
MainController mainController = Modular.get<MainController>();

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    mainController.updateUser();
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
              label: "Home",
              icon: Icon(FontAwesomeIcons.house),
            ),
            BottomNavigationBarItem(
              activeIcon: Icon(FontAwesomeIcons.solidHeart),
              label: "Matchs",
              icon: Icon(FontAwesomeIcons.heart),
            ),
            //Colocaar o rostinho da pessoa
            BottomNavigationBarItem(
              activeIcon: Icon(FontAwesomeIcons.solidCircleUser),
              label: "Perfil",
              icon: Icon(FontAwesomeIcons.circleUser),
            ),
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
