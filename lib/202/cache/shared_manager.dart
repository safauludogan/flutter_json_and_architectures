import 'package:flutter_json_hardwareandro/202/cache/shared_not_initialize.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedKeys { counter,users }

class SharedManager {
  SharedPreferences? preferences;

  SharedManager();

  Future<void> init() async {
    preferences = await SharedPreferences.getInstance();
  }

  void _checkPreferences() {
    if (preferences == null) throw SharedNotInitializeException();
  }

  Future<void> saveString(SharedKeys key, String value) async {
    _checkPreferences();
    await preferences?.setString(key.name, value);
  }

  ///DİZİ ŞEKLİNDE VERİ SAKLAMA
  Future<void> saveStringItems(SharedKeys key, List<String> value) async {
    _checkPreferences();
    await preferences?.setStringList(key.name, value);
  }
  ///DİZİ ŞEKLİNDE VERİ ÇEKME
  List<String>? getStrings(SharedKeys key) {
    _checkPreferences();
    return preferences?.getStringList(key.name);
  }

  String? getString(SharedKeys key) {
    _checkPreferences();
    return preferences?.getString(key.name);
  }

  Future<bool> removeItem(SharedKeys key) async {
    _checkPreferences();
    return (await preferences?.remove(key.name)) ?? false;
  }
}
