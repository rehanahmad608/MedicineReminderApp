import 'package:flutter/material.dart';
import 'package:stellar/src/infrastructure/screen_size_config/screen_size_config.dart';
import 'package:stellar/src/presentation/screens/intro/number_registration.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/body.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/heading.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/next_button.dart';

class ScreenFour extends StatelessWidget {
  const ScreenFour({Key? key}) : super(key: key);
  static const routeName = '/intro-four-screen';

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget _displayAppbar() => AppBar();

    Widget _displayHeading() =>
        const IntroHeading(heading: 'Make A Reminder Call To Mediminder');

    Widget _displayBodyText() => const IntroBody(
          body:
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio',
        );

    Widget _displayBodyImage() => Image(
          image: const AssetImage('assets/images/intro4.png'),
          height: ScreenConfig.screenSizeHeight * 0.4,
        );

    Widget _displayBody() => SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(ScreenConfig.screenSizeWidth * 0.1,
                0.0, ScreenConfig.screenSizeWidth * 0.1, 0.0),
            width: ScreenConfig.screenSizeWidth,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _displayHeading(),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.03,
                ),
                _displayBodyText(),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.03,
                ),
                // _displayBodyImage(),
                // const Spacer(),
                // const NextButton(
                //   value: 4,
                //   route: NumberRegistrationScreen.routeName,
                // ),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.05,
                ),
              ],
            ),
          ),
        );

    return Scaffold(
      appBar: _displayAppbar(),
      body: _displayBody(),
      floatingActionButton: const NextButton(
        value: 3,
        route: NumberRegistrationScreen.routeName,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: Dividers.bottomdivider(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
