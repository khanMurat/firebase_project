import 'package:firebase_project/core/enums/cache_key_enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CacheManager {
  SharedPreferences? _preferences;

  CacheManager._init() {
    SharedPreferences.getInstance().then((value) {
      _preferences = value;
    });
  }

  static final CacheManager _instance = CacheManager._init();
  static CacheManager get instance => _instance;

  Future preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();
  }

  Future<void> clearAll() async {
    await _preferences!.clear();
  }

  // Hafızadan silinmesini istemediğimiz itemi kaydedip gerisini silmek için.
  Future<void> clearAndSaveItem(CacheKeys key) async {
    var val = _preferences!.getString(key.toString()) ?? '';
    await _preferences!.clear();
    await _preferences!.setString(key.toString(), val);
  }

  Future<void> saveString(CacheKeys key, String value) async {
    await _preferences!.setString(key.toString(), value);
  }

  String getString(CacheKeys key) {
    return _preferences!.getString(key.toString()) ?? '';
  }
}
