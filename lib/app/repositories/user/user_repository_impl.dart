import 'package:app_cuidapet/app/core/exceptions/failure.dart';
import 'package:app_cuidapet/app/core/exceptions/user_exists_exception.dart';
import 'package:app_cuidapet/app/core/exceptions/user_not_found_exception.dart';
import 'package:app_cuidapet/app/core/helpers/loger.dart';
import 'package:app_cuidapet/app/core/rest_client/rest_client.dart';
import 'package:app_cuidapet/app/core/rest_client/rest_client_exception.dart';
import 'package:app_cuidapet/app/repositories/user/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final RestClient _restClient;
  final Logger _log;

  UserRepositoryImpl({
    required RestClient restClient,
    required Logger log,
  })  : _restClient = restClient,
        _log = log;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _restClient.unauth().post(
        '/auth/register',
        data: {
          'email': email,
          'password': password,
        },
      );
    } on RestClientException catch (e, s) {
      if (e.statusCode ==
          400 &
              e.response?.data['message'].toLowerCase
                  .contains('Usuário já cadastrado')) {
        _log.error('Usuário já cadastado', e, s);
        throw UserExistsException();
      }
      if (e.statusCode == 500) {
        _log.error('Erro no backend', e, s);
        throw UserExistsException();
      }

      _log.error('Erro ao registar usuário', e, s);
      throw Failure();
    }
  }

  @override
  Future<String> login(String login, String password) async {
    try {
      final result = await _restClient
          .unauth()
          .post('/auth/login', data: {'login': login, 'password': password});
      return result.data['access_token'];
    } on RestClientException catch (e, s) {
      _log.error('Erro ao realizar login', e, s);
      if (e.statusCode == 403) {
        _log.error('Usuário não encontrado', e, s);
        throw UserNotFoundException();
      }
      throw Failure(message: 'Erro ao realizar login');
    }
  }
}
