import 'package:flutter_modular/flutter_modular.dart';

import 'controller/home_controller.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeController()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => HomePage()),
        // ModuleRoute('/login', module: LoginModule()),
      ];
}
