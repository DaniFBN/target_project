abstract class ILocalStorageService {
  Future<void> save(String key, List<String> value);
  Future<List<String>> get(String key);
}
