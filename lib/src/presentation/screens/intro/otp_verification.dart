import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar/src/infrastructure/screen_size_config/screen_size_config.dart';
import 'package:stellar/src/presentation/screens/homepage/homepage.dart';
import 'package:stellar/src/presentation/ui/templates/app_bar.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/body.dart';
import 'package:stellar/src/presentation/ui/templates/my_buttons.dart';
import 'package:stellar/src/presentation/ui/templates/validator_error.dart';

class OTPVerificationScreen extends StatefulWidget {
  final String mobileNum;
  const OTPVerificationScreen({Key? key, required this.mobileNum})
      : super(key: key);
  static const routeName = '/otp-verification-screen';

  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String phoneNum = "";
  late Timer _timer;
  int _start = 30;
  bool resendOption = false;
  bool error = false;
  String otp = "";
  final _formKey = GlobalKey<FormState>();
  late TextEditingController otpController;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            resendOption = true;
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  void reStartTimer() {
    _start = 30;
    setState(() {
      resendOption = false;
    });
    startTimer();
  }

  @override
  void initState() {
    super.initState();
    phoneNum = widget.mobileNum;
    otpController = TextEditingController();
    startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    phoneNum = widget.mobileNum;
    PreferredSizeWidget _displayAppbar() => MyAppbar(
          title: 'OTP Verification',
          hasTitle: true,
          hasBackButton: true,
          leadingIconData: Icons.arrow_back_ios,
          actions: const [],
        );

    Widget _displayBodyText({required String text}) => Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: IntroBody(
            body: text,
          ),
        );

    Widget _displayBodyText2({required String text}) => Text(text,
        textAlign: TextAlign.center,
        style: ScreenConfig.theme.textTheme.bodyText1?.copyWith(
            color: Colors.black,
            wordSpacing: 1.0,
            // fontSize: 14,
            fontWeight: FontWeight.normal));

    Widget _displayPhoneNumber() => Text(widget.mobileNum,
        style: ScreenConfig.theme.textTheme.bodyText1?.copyWith(
            // fontSize: 14,
            fontWeight: FontWeight.w800,
            decoration: TextDecoration.underline,
            color: Colors.black));

    Widget _displayTextField() => Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                keyboardType: const TextInputType.numberWithOptions(),
                controller: otpController,
                style: ScreenConfig.theme.textTheme.headline1?.copyWith(
                    fontWeight: FontWeight.w700, color: Colors.black),
                textAlign: TextAlign.center,
                inputFormatters: [
                  FilteringTextInputFormatter.deny(RegExp("[a-zA-Z ]"))
                ],
                validator: (value) {
                  if (value == null || value.length < 4) {
                    return 'OTP is not valid';
                  } else if (otpController.text.isEmpty) {
                    return 'OTP can not be empty';
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: '0000',
                  hintStyle: ScreenConfig.theme.textTheme.headline2?.copyWith(
                      fontWeight: FontWeight.w800, color: Colors.grey),
                ),
                onChanged: (val) {
                  if (val.length < 4 || otpController.text.isEmpty) {
                    setState(() {
                      error = true;
                    });
                  }
                  if (val.length == 4) {
                    FocusScope.of(context).unfocus();
                    setState(() {
                      error = false;
                    });
                  } else if (val.length > 4) {
                    otpController.text = '';
                    setState(() {
                      error = false;
                    });
                  }
                },
              ),
              Divider(
                color: Colors.grey,
                thickness: 2,
                endIndent: ScreenConfig.screenSizeWidth * 0.05,
                indent: ScreenConfig.screenSizeWidth * 0.05,
              ),
            ],
          ),
        );

    Widget _displayTimer() => _start == 0
        ? TextButton(
            onPressed: () {
              otpController.text = '';
              // BlocProvider.of<UserBloc>(context).add(
              //   ResendOTP(
              //     phoneNum: widget.mobileNum,
              //   ),
              // );
              reStartTimer();
            },
            child: Text('Resend OTP',
                style: ScreenConfig.theme.textTheme.bodyText1?.copyWith(
                    // fontSize: 14,
                    color: Colors.black)))
        : _displayBodyText(
            text:
                _start < 10 ? 'Resend OTP 0:0$_start' : 'Resend OTP 0:$_start');

    Widget _displayButton(
      BuildContext context,
    ) {
      return SizedBox(
        width: ScreenConfig.screenSizeWidth * 0.90,
        child: Buttons.fullWidthButton(
            text: 'Continue',
            func: () {
              if (otpController.text.length == 4 &&
                  otpController.text.isNotEmpty) {
                setState(() {
                  error = false;
                });

                // _formKey.currentState!.save();
                // BlocProvider.of<UserBloc>(context).add(Verify(
                //     code: otpController.text, phoneNum: widget.mobileNum));
                Navigator.pushNamed(context, HomePage.routeName);
              } else {
                // print('here');
                setState(() {
                  error = true;
                });
                FocusScope.of(context).unfocus();
                // ScaffoldMessenger.of(context).showSnackBar(
                //     const SnackBar(content: Text('OTP is not correct')));
              }
            }),
      );
    }

    Widget _displayBody(
      BuildContext context,
    ) =>
        SafeArea(
          child: Container(
            padding: EdgeInsets.fromLTRB(ScreenConfig.screenSizeWidth * 0.1,
                0.0, ScreenConfig.screenSizeWidth * 0.1, 0.0),
            width: ScreenConfig.screenSizeWidth,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _displayBodyText(text: 'We have sent an SMS OTP to'),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.005,
                ),
                _displayPhoneNumber(),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.04,
                ),
                _displayBodyText2(
                    text: 'Please enter the 4 digit verification code below.'),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.04,
                ),
                _displayTextField(),
                error == true
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: errorHeading('OTP is not valid'),
                      )
                    : const SizedBox(),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.03,
                ),
                _displayTimer(),
                const Spacer(),
              ],
            ),
          ),
        );

    // return BlocConsumer<UserBloc, UserState>(
    //   listener: (context, state) {
    //     if (state is UserVerified) {
    //       // print('UserVerified');
    //       Navigator.push(
    //         context,
    //         MaterialPageRoute(
    //             builder: (context) =>
    //                 BasicInfoScreen(mobileNum: widget.mobileNum)),
    //       );
    //     } else if (state is UserResentOTPVerify) {
    //       // otpController.text = '';
    //       print('here in userresentotpverify');
    //     } else if (state is UserVerify) {
    //       otpController.text = '';
    //       print('here in userverify');
    //     } else if (state is VerificationError) {
    //       // print(state.error);
    //     } else if (state is UserLoggedIn) {
    //       // print("UserLoggedIn");
    //       Navigator.of(context).pushNamed(HomeScreen.routeName);
    //     }
    //   },
    //   builder: (context, state) {
    return Scaffold(
      appBar: _displayAppbar(),
      body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: _displayBody(
            context,
          )),
      floatingActionButton: _displayButton(
        context,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
