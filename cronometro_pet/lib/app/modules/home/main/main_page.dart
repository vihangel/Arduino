import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../shared/resources/colors.dart';
import 'main_controller.dart';

MainController controller = Modular.get<MainController>();

class MainPage extends StatelessWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Observer(builder: (context) {
      return controller.cards[controller.homeController.userIndex];
    });
  }
}
