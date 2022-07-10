import 'package:flutter_modular/flutter_modular.dart';
import 'package:pega_pega/app/services/auth/auth_service.dart';

import 'controller/home_controller.dart';
import 'home_page.dart';
import 'main/main_controller.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController()),
    Bind.lazySingleton((i) => MainController()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        // ModuleRoute('/login', module: LoginModule()),
      ];
}
