import 'package:flutter/material.dart';
import 'package:stellar/src/infrastructure/screen_size_config/screen_size_config.dart';
import 'package:stellar/src/presentation/screens/intro/number_registration.dart';
import 'package:stellar/src/presentation/screens/intro/screen_two.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/body.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/heading.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/next_button.dart';

class ScreenOne extends StatelessWidget {
  const ScreenOne({Key? key}) : super(key: key);
  static const routeName = '/intro-one-screen';

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);

    Widget _displaySkipButton() => TextButton(
        onPressed: () {
          // Navigator.pushNamed(context, PickupLocationScreen.routeName);
          Navigator.pushNamed(context, NumberRegistrationScreen.routeName);
        },
        child: Text(
          'Skip',
          style: ScreenConfig.theme.textTheme.headline6?.copyWith(
              fontWeight: FontWeight.normal,
              color: ScreenConfig.theme.colorScheme.primary),
        ));

    PreferredSizeWidget _displayAppbar() => AppBar(
          automaticallyImplyLeading: false,
          actions: [_displaySkipButton()],
        );

    Widget _displayHeading() =>
        const IntroHeading(heading: 'What Medicines Are\nYou Looking For?');

    Widget _displayBodyText() => const IntroBody(
          body:
              'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborumnumquam',
        );

    Widget _displayBodyImage() => Image(
          image: const AssetImage('assets/images/ScreenOne.json'),
          height: ScreenConfig.screenSizeHeight * 0.6,
          // width: ScreenConfig.screenSizeWidth *0.9,
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
                //   value: 1,
                //   route: ScreenTwo.routeName,
                // ),
                //   SizedBox(
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
        value: 1,
        route: ScreenTwo.routeName,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
