import 'package:app_cuidapet/app/modules/auth/home/auth_home_page.dart';
import 'package:app_cuidapet/app/modules/auth/login/login_module.dart';
import 'package:app_cuidapet/app/modules/auth/register/register_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute,
        child: (_, __) => AuthHomePage(authstore: Modular.get())),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/register', module: RegisterModule())
  ];
}
