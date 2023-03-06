import 'package:flutter/cupertino.dart';
import 'package:stellar/src/presentation/screens/homepage/homepage.dart';
import 'package:stellar/src/presentation/screens/intro/number_registration.dart';
import 'package:stellar/src/presentation/screens/intro/otp_verification.dart';
import 'package:stellar/src/presentation/screens/intro/screen_four.dart';
import 'package:stellar/src/presentation/screens/intro/screen_one.dart';
import 'package:stellar/src/presentation/screens/intro/screen_three.dart';
import 'package:stellar/src/presentation/screens/intro/screen_two.dart';
import 'package:stellar/src/presentation/screens/medicine_details/medicine_details.dart';

final Map<String, Widget Function(BuildContext)> routes = {
  ScreenOne.routeName: (ctx) => const ScreenOne(),
  ScreenTwo.routeName: (ctx) => const ScreenTwo(),
  ScreenThree.routeName: (ctx) => const ScreenThree(),
  ScreenFour.routeName: (ctx) => const ScreenFour(),
  NumberRegistrationScreen.routeName: (ctx) => const NumberRegistrationScreen(),
  OTPVerificationScreen.routeName: (ctx) => const OTPVerificationScreen(
        mobileNum: '',
      ),
  HomePage.routeName: (ctx) => HomePage(),
};
