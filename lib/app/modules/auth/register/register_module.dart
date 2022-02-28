import 'package:app_cuidapet/app/core/helpers/loger.dart';
import 'package:app_cuidapet/app/core/rest_client/rest_client.dart';
import 'package:app_cuidapet/app/modules/auth/register/register_controller.dart';
import 'package:app_cuidapet/app/modules/auth/register/register_page.dart';
import 'package:app_cuidapet/app/repositories/user/user_repository.dart';
import 'package:app_cuidapet/app/repositories/user/user_repository_impl.dart';
import 'package:app_cuidapet/app/services/user/user_service.dart';
import 'package:app_cuidapet/app/services/user/user_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton<RegisterController>(
      (i) => RegisterController(log: i(), userService: i()),
    ),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => RegisterPage())
  ];
}
