import 'package:flutter/material.dart';

import '../../../../infrastructure/screen_size_config/screen_size_config.dart';
class IntroHeading extends StatelessWidget {
  final String heading;
  const IntroHeading({Key? key,required this.heading}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(heading,
        textAlign: TextAlign.center,
        style: ScreenConfig.theme.textTheme.headline2
            ?.copyWith(fontWeight: FontWeight.w700));
  }
}
