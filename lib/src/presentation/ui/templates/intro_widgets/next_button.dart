import 'package:flutter/material.dart';

import '../../../../infrastructure/screen_size_config/screen_size_config.dart';

class NextButton extends StatelessWidget {
  final int value;
  final String route;

  const NextButton({Key? key, required this.value, required this.route})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Stack(
        children: [
          SizedBox(
              height: ScreenConfig.screenSizeHeight * 0.08,
              width: ScreenConfig.screenSizeWidth * 0.16,
              child: CircularProgressIndicator(
                strokeWidth: 2.0,
                value: value / 3,
                valueColor: AlwaysStoppedAnimation<Color>(Colors.blue.shade900),
                backgroundColor: Colors.grey.shade300,
              )),
          Positioned(
              top: ScreenConfig.screenSizeHeight * 0.025,
              left: ScreenConfig.screenSizeWidth * 0.05,
              child: const Center(
                child: Icon(
                  Icons.arrow_forward,
                ),
              )),
        ],
      ),
    );
  }
}
