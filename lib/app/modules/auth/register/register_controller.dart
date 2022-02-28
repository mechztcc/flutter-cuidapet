import 'package:app_cuidapet/app/core/exceptions/user_exists_exception.dart';
import 'package:app_cuidapet/app/core/helpers/loger.dart';
import 'package:app_cuidapet/app/core/ui/components/loader.dart';
import 'package:app_cuidapet/app/core/ui/components/messages.dart';
import 'package:app_cuidapet/app/services/user/user_service.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'register_controller.g.dart';

class RegisterController = RegisterControllerBase with _$RegisterController;

abstract class RegisterControllerBase with Store {
  final UserService _userService;
  final Logger _log;

  RegisterControllerBase({
    required UserService userService,
    required Logger log,
  })  : _userService = userService,
        _log = log;

  Future<void> register(String email, String password) async {
    try {
      Loader.show();
      await _userService.register(email, password);
      Loader.hide();
      Modular.to.popAndPushNamed('/auth/');
    } on UserExistsException {
      Loader.hide();
      Messages.alert('E-mail já cadastrado');
    } catch (e, s) {
      _log.error('Falha ao registrar o usuário', e, s);
      Loader.hide();
      Messages.alert('Falha ao registrar o usuárioaaa');
    }
  }
}
