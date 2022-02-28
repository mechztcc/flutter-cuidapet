import 'package:app_cuidapet/app/core/exceptions/failure.dart';
import 'package:app_cuidapet/app/core/helpers/loger.dart';
import 'package:app_cuidapet/app/repositories/user/user_repository.dart';
import 'package:app_cuidapet/app/services/user/user_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserServiceImpl implements UserService {
  final UserRepository _userRepository;
  final Logger _log;

  UserServiceImpl({required UserRepository userRepository, required Logger log})
      : _userRepository = userRepository,
        _log = log;

  @override
  Future<void> register(String email, String password) async {
    try {
      await _userRepository.register(email, password);
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao criar usuário no FirebaseAuth', e, s);
      throw Failure(message: 'Erro ao criar usuário no FirebaseAuth');
    }
  }

  @override
  Future<void> login(String login, String password) async {
    try {
      final accessToken = await _userRepository.login(login, password);
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: login, password: password);
    } on FirebaseAuthException catch (e, s) {
      _log.error('Erro ao logar no firebase', e, s);
      throw Failure(message: 'Erro ao realizar login no firebase');
    }
  }
}
