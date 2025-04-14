import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  static LocalPreferences? _instance;
  SharedPreferences? _sharedPreferences;

  String? isLoggedIn;

  LocalPreferences._();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static LocalPreferences get instance {
    _instance ??= LocalPreferences._();
    return _instance!;
  }

  void setIsLoggedIn(String? value) {
    _sharedPreferences?.setString(isLoggedIn!, value ?? '');
  }

  String? getIsLoggedIn() {
    return _sharedPreferences?.getString(isLoggedIn ?? '');
  }
}
