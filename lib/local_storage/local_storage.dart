import 'package:shared_preferences/shared_preferences.dart';

enum StorageKey {
  ip,
  sendPort,
  receivePort,
  sendDomain,
  receiveDomain,
}
extension on StorageKey {
  String get name => toString().split(".").last;
}

class LocalStorage {
  final Future<SharedPreferences> instance = SharedPreferences.getInstance();

  Future<void> increment(StorageKey key, String value) async {
    final SharedPreferences _prefs = await instance;
    if (int.tryParse(value) != null) {
      await _prefs.setInt(key.name, int.parse(value));
    } else {
      await _prefs.setString(key.name, value);
    }
  }

  Future<String?> get(StorageKey key) async {
    final SharedPreferences _prefs = await instance;
    return Future<String?>.value(_prefs.getString(key.name));
  }
}
