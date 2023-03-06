import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:stellar/src/infrastructure/screen_size_config/screen_size_config.dart';
import 'package:stellar/src/presentation/screens/intro/screen_one.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash-screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer _timer;

  int _start = 3;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
          Navigator.of(context).pushReplacementNamed(ScreenOne.routeName);
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConfig().init(context);
    // return BlocListener<UserBloc, UserState>(
    //   listener: (context, state) {
    //     if (state is UserLoggedIn) {
    //       //   BlocProvider.of<BankBloc>(context).add(GetAllBanks());
    //       //  Navigator.of(context)
    //       //       .pushReplacementNamed(MainDashboard.routeName);
    //     } else if (state is UserInitial) {
    //       Navigator.of(context)
    //           .pushReplacementNamed(NumberRegistrationScreen.routeName);
    //     }
    //   },
    return Scaffold(
      body: Stack(
        children: [
          // Positioned(
          //   left: 0,
          //   child: SizedBox(
          //     height: ScreenConfig.screenSizeHeight * 1.1,
          //     width: ScreenConfig.screenSizeWidth,
          //     child: Image.asset('assets/images/Group 3899.png',
          //         fit: BoxFit.cover),
          //   ),
          // ),
          Center(
            child: SizedBox(
              width: ScreenConfig.screenSizeWidth * 0.8,
              child: ImageIcon(
                const AssetImage('assets/icons/bottle.png'),
                size: 100,
                color: Color.fromARGB(255, 91, 62, 187),
              ),
              // Lottie.asset('assets/animations/traveling_camera_SS.json',
              //     animate: true, fit: BoxFit.contain),
            ),
          ),
        ],
      ),
    );
  }
}
