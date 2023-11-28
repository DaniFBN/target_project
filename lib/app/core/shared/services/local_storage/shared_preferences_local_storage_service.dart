import 'package:shared_preferences/shared_preferences.dart';

import 'i_local_storage_service.dart';

class SharedPreferencesLocalStorageService implements ILocalStorageService {
  final SharedPreferences _storage;

  const SharedPreferencesLocalStorageService(this._storage);

  @override
  Future<List<String>> get(String key) async {
    return _storage.getStringList(key) ?? [];
  }

  @override
  Future<void> save(String key, List<String> value) async {
    await _storage.setStringList(key, value);
  }
}
