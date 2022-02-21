import 'package:app_cuidapet/app/core/local_storages/local_security_storage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class FlutterSecureStorageLocalSecurityStorageImpl
    implements LocalSecurityStorage {
  FlutterSecureStorage get _instance => const FlutterSecureStorage();

  @override
  Future<void> clear() async {
    await _instance.deleteAll();
  }

  @override
  Future<bool> contains(String key) {
    return _instance.containsKey(key: key);
  }

  @override
  Future<String?> read(String key) {
    return _instance.read(key: key);
  }

  @override
  Future<void> remove(String key) {
    return _instance.delete(key: key);
  }

  @override
  Future<void> write(String key, value) {
    return _instance.write(key: key, value: value);
  }
}
