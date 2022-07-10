import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_module.dart';
import 'controller/login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginController()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/',
            child: (context, args) => LoginPage(
                  controller: Modular.get(),
                )),
      ];
}
