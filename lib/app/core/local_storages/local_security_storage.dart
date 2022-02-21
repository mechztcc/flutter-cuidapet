abstract class LocalSecurityStorage {
  Future<String?> read(String key);
  Future<void> write(String key, value);
  Future<bool> contains(String key);
  Future<void> clear();
  Future<void> remove(String key);
}
