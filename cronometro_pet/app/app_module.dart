import 'package:flutter_modular/flutter_modular.dart';
import 'package:pega_pega/app/services/auth/auth_service.dart';

import 'modules/home/home_module.dart';
import 'modules/login/login_module.dart';
import 'modules/splash/splash_page.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthService()),
    // Bind.lazySingleton<AuthService>((i) => AuthServiceImpl()),
  ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const SplashPage()),
        ModuleRoute('/login', module: LoginModule()),
        ModuleRoute('/home', module: HomeModule()),
      ];

  // ChildRoute('/config/places/share/:id/:hasPlace',
  // child: (_, args) => SharePlacePage(
  //       userId: args.params['id'],
  //       hasPlace: args.params['hasPlace'],
  //     )),
}
