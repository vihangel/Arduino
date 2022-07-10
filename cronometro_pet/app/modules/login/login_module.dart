import 'package:flutter_modular/flutter_modular.dart';
import 'package:pega_pega/app/modules/login/controller/login_controller.dart';
import 'package:pega_pega/app/modules/login/login_page.dart';

import '../home/home_module.dart';

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
