import 'package:app_cuidapet/app/core/helpers/loger.dart';
import 'package:app_cuidapet/app/core/local_storages/local-storage.dart';
import 'package:app_cuidapet/app/core/local_storages/shared_preferences_local_storage.dart';
import 'package:app_cuidapet/app/core/rest_client/dio_rest_client.dart';
import 'package:app_cuidapet/app/core/rest_client/rest_client.dart';
import 'package:app_cuidapet/app/modules/core/auth/auth_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(), export: true),
    Bind.factory<RestClient>((i) => DioRestClient(), export: true),
    Bind.lazySingleton<Logger>((i) => LoggerImpl(), export: true),
    Bind.lazySingleton<LocalStorage>((i) => SharedPreferencesLocalStorage(),
        export: true),
  ];
}
