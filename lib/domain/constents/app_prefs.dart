import 'package:shared_preferences/shared_preferences.dart';

class AppPrefs {
  SharedPreferences? prefs;
  Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> setPrefs(String token) async {
    await initPrefs();
    prefs!.setString('token', token);
    print(token);
  }

  Future<String> getPrefs() async {
    await initPrefs();
    return prefs!.getString("token") ?? "";
  }
}
