abstract class LocalStorage {
  Future<P?> read<P>(String key);
  Future<void> write<P>(String key, P value);
  Future<bool> contains<P>(String key);
  Future<void> clear<P>(String key);
  Future<void> remove<P>(String key);
}
