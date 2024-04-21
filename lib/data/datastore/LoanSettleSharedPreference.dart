import 'package:flutter/animation.dart';
import 'package:loansettle/utils/FilesUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoanSettleSharedPreference {
  static final LoanSettleSharedPreference _instance =
      LoanSettleSharedPreference._privateConstructor();

  factory LoanSettleSharedPreference() {
    return _instance;
  }

  LoanSettleSharedPreference._privateConstructor() {
    _initializeSharedPreference();
  }

  SharedPreferences? _sharedPreferences;

  // Getter to get the SharedPreferences instance
  Future<void> _initializeSharedPreference() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  final String _UserLoing = "USER_LOGIN";
  final String _UserClientID = "USER_CLIENT_ID";

  void setUserIsLogin() {
    _sharedPreferences?.setBool(_UserLoing, true);
  }

  bool isUserLogin() {
    debugLogs(" Shared Preference ${_sharedPreferences == null}");
    return _sharedPreferences?.getBool(_UserLoing) ?? false;
  }

  void setClientID(int value) {
    _sharedPreferences?.setInt(_UserClientID, value);
  }

  int getClientID() {
    return _sharedPreferences?.getInt(_UserClientID) ?? 1;
  }

  void logout() {
    _sharedPreferences?.remove(_UserLoing);
    _sharedPreferences?.remove(_UserClientID);
  }
}
