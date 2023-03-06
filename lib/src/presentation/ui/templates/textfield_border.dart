import 'package:flutter/material.dart';

import '../../../infrastructure/screen_size_config/screen_size_config.dart';
textFieldBorder() {
  return  OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(12.0)),
    borderSide: BorderSide(color: ScreenConfig.theme.colorScheme.primary , width: 0.5),
  );
}