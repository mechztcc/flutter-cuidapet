import 'package:app_cuidapet/app/core/exceptions/user_not_found_exception.dart';
import 'package:app_cuidapet/app/core/helpers/loger.dart';
import 'package:app_cuidapet/app/core/ui/components/loader.dart';
import 'package:app_cuidapet/app/core/ui/components/messages.dart';
import 'package:app_cuidapet/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserService _userService;
  final Logger _log;

  _LoginControllerBase({required UserService userService, required Logger log})
      : _userService = userService,
        _log = log;

  Future<void> login(String login, String password) async {
    try {
      Loader.show();
      await _userService.login(login, password);
      Loader.hide();
      Modular.to.navigate('/auth/');
    } on UserNotFoundException {
      Messages.alert('Login ou senha inválidos.');
      Loader.hide();
    } catch (e, s) {
      _log.error('Erro ao realizar login', e, s);
      Messages.alert('Erro ao realizar o login, tente novamente mais tarde');
      Loader.hide();
    }
  }
}
