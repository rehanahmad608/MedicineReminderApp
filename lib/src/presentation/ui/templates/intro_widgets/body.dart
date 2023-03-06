import 'package:flutter/material.dart';

import '../../../../infrastructure/screen_size_config/screen_size_config.dart';

class IntroBody extends StatelessWidget {
  final String body;

  const IntroBody({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(body,
        textAlign: TextAlign.center,
        style: ScreenConfig.theme.textTheme.bodyText1?.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.normal,
            wordSpacing: 2));
  }
}
