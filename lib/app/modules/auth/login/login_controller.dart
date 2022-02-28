import 'package:app_cuidapet/app/services/user/user_service.dart';
import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final UserService _userService;

  _LoginControllerBase({required UserService userService})
      : _userService = userService;
}
