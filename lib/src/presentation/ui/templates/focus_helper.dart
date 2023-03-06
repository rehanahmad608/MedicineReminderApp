import 'package:flutter/cupertino.dart';

class FocusHelper {
  static unfocusScreen(BuildContext context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }
}
