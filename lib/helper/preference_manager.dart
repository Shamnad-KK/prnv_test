// ignore_for_file: constant_identifier_names

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceManager {
  static const String AUTHORIZATION_TOKEN = 'token';

  Future<void> setToken(bool value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(AUTHORIZATION_TOKEN, value);
  }

  Future<bool> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    final res = sharedPreferences.getBool(AUTHORIZATION_TOKEN) ?? false;
    return res;
  }

  Future<void> logOut() async {
    await setToken(false);
  }
}
