import 'package:flutter/material.dart';

import '../../../infrastructure/screen_size_config/screen_size_config.dart';

Widget errorHeading(String error) {
  return Text(
    error,
    style: ScreenConfig.theme.textTheme.bodyText1?.merge(TextStyle(
        color: ScreenConfig.theme.colorScheme.error,
        fontWeight: FontWeight.normal)),
    textAlign: TextAlign.left,
  );
}
