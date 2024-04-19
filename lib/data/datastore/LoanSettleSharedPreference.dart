import 'package:loansettle/utils/FilesUtils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoanSettleSharedPreference {
  static final LoanSettleSharedPreference _instance = LoanSettleSharedPreference._privateConstructor();

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

  final String _UserLoing="USER_LOGIN";

  void setUserIsLogin(){
    _sharedPreferences?.setBool(_UserLoing, true);
  }

  bool isUserLogin(){
    debugLogs(" Shared Preference ${_sharedPreferences ==null }");
    return _sharedPreferences?.getBool(_UserLoing)?? false;
  }

  void logout(){
    _sharedPreferences?.remove(_UserLoing);
  }


}

