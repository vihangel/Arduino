import 'package:asuka/snackbars/asuka_snack_bar.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../services/auth/auth_service.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  @observable
  AuthService controller = Modular.get<AuthService>();

  @action
  Future<void> signIn() async {
    try {
      // emit(state.copyWith(status: LoginStatus.loading));
      await controller.signIn();
      // await controller.signOut();
      AsukaSnackbar.success('Logado com sucesso!').show();

      //Nao pode usar pop nessa navegação pois o pop não funciona como o back
      Modular.to.pushNamed("/home/");
    } catch (e, s) {
      print('Error ao realizar login, error: $e, stack: $s');
      AsukaSnackbar.success('Error ao realizar login, error: $e').show();
    }
  }
}
