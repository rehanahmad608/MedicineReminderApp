import 'package:flutter/material.dart';
import 'package:stellar/src/infrastructure/screen_size_config/screen_size_config.dart';
import 'package:stellar/src/presentation/screens/intro/number_registration.dart';
import 'package:stellar/src/presentation/screens/intro/screen_four.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/body.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/heading.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/next_button.dart';

class ScreenThree extends StatelessWidget {
  const ScreenThree({Key? key}) : super(key: key);
  static const routeName = '/intro-three-screen';

  @override
  Widget build(BuildContext context) {
    Widget _displaySkipButton() => TextButton(
        onPressed: () {
          Navigator.pushNamed(context, NumberRegistrationScreen.routeName);
        },
        child: Text(
          'Skip',
          style: ScreenConfig.theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.normal,
              color: ScreenConfig.theme.colorScheme.primary),
        ));

    PreferredSizeWidget _displayAppbar() => AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          actions: [_displaySkipButton()],
        );

    Widget _displayHeading() =>
        const IntroHeading(heading: 'Get Your Medicines On Time');

    Widget _displayBodyText() => const IntroBody(
          body:
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentiumoptio',
        );

    Widget _displayBodyImage() => Image(
          image: const AssetImage('assets/images/ScreenThree.png'),
          height: ScreenConfig.screenSizeHeight * 0.4,
          width: ScreenConfig.screenSizeWidth * 0.6,
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
                //   value: 3,
                //   route: NumberRegistrationScreen.routeName,
                // ),
                // SizedBox(
                //   height: ScreenConfig.screenSizeHeight * 0.05,
                // ),
              ],
            ),
          ),
        );

    return Scaffold(
      appBar: _displayAppbar(),
      body: _displayBody(),
      floatingActionButton: const NextButton(
        value: 3,
        route: ScreenFour.routeName,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
