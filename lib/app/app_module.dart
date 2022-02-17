import 'package:app_cuidapet/app/modules/auth/auth_module.dart';
import 'package:app_cuidapet/app/modules/core/core_module.dart';
import 'package:app_cuidapet/app/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  List<Module> get imports => [
        CoreModule(),
      ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute('/auth', module: AuthModule()),
    ModuleRoute('/home', module: HomeModule())
  ];
}
