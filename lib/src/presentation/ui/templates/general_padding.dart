import 'package:flutter/material.dart';
import '../../../infrastructure/screen_size_config/screen_size_config.dart';
class GeneralPadding {

  static EdgeInsets generalPadding()=>EdgeInsets.fromLTRB(ScreenConfig.screenSizeWidth * 0.03,
      0.0, ScreenConfig.screenSizeWidth * 0.03, 0.0);

}
