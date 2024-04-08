import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void debugLogs(String msg) {
  if (kDebugMode) {
    print(msg);
  }
}

extension navigation on BuildContext {
  void goToNextScreen(String loc) {
    Navigator.pushNamed(this, loc);
  }

  void goToNextScreenPopUp(String loc) {
    Navigator.pushNamedAndRemoveUntil(this, loc, (route) => false);
  }
}
