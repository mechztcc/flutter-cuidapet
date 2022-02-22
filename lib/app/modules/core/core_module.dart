import 'package:app_cuidapet/app/core/helpers/loger.dart';
import 'package:app_cuidapet/app/core/local_storages/flutter_secure_storage_local_securety_storage_imp.dart';
import 'package:app_cuidapet/app/core/local_storages/local-storage.dart';
import 'package:app_cuidapet/app/core/local_storages/local_security_storage.dart';
import 'package:app_cuidapet/app/core/local_storages/shared_preferences_local_storage_impl.dart';
import 'package:app_cuidapet/app/core/rest_client/dio_rest_client.dart';
import 'package:app_cuidapet/app/core/rest_client/rest_client.dart';
import 'package:app_cuidapet/app/modules/core/auth/auth_store.dart';
import 'package:app_cuidapet/app/repositories/user/user_repository.dart';
import 'package:app_cuidapet/app/repositories/user/user_repository_impl.dart';
import 'package:app_cuidapet/app/services/user/user_service.dart';
import 'package:app_cuidapet/app/services/user/user_service_impl.dart';
import 'package:flutter_modular/flutter_modular.dart';

class CoreModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AuthStore(), export: true),
    Bind.factory<RestClient>((i) => DioRestClient(), export: true),
    Bind.lazySingleton<Logger>((i) => LoggerImpl(), export: true),
    Bind.lazySingleton<LocalStorage>(
      (i) => SharedPreferencesLocalStorageImpl(),
      export: true,
    ),
    Bind.lazySingleton<LocalSecurityStorage>(
      (i) => FlutterSecureStorageLocalSecurityStorageImpl(),
      export: true,
    ),
    Bind.lazySingleton<UserRepository>(
      (i) => UserRepositoryImpl(restClient: i(), log: i()),
      export: true,
    ),
    Bind.lazySingleton<UserService>(
      (i) => UserServiceImpl(userRepository: i(), log: i()),
      export: true,
    )
  ];
}
