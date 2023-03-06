import 'package:flutter/material.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:stellar/src/infrastructure/screen_size_config/screen_size_config.dart';
import 'package:stellar/src/presentation/screens/intro/otp_verification.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/default_snackbar.dart';
import 'package:stellar/src/presentation/ui/templates/intro_widgets/heading.dart';
import 'package:stellar/src/presentation/ui/templates/my_buttons.dart';
import 'package:stellar/src/presentation/ui/templates/phone_number_textfield.dart';

class NumberRegistrationScreen extends StatefulWidget {
  const NumberRegistrationScreen({Key? key}) : super(key: key);
  static const routeName = '/number-registration-screen';

  @override
  State<NumberRegistrationScreen> createState() =>
      _NumberRegistrationScreenState();
}

class _NumberRegistrationScreenState extends State<NumberRegistrationScreen> {
  String? countryCode;
  String initialCountry = 'SA';
  PhoneNumber phoneNumber = const PhoneNumber(isoCode: 'SA', nsn: '');
  // String phone = "";
  // String flag = '🇸🇦';
  // String code = '966';
  // bool error = true;
  final _formkey = GlobalKey<FormState>();
  TextEditingController phoneNum = TextEditingController();
  @override
  void initState() {
    phoneNumberErrorShownWithTextField = false;
    phoneNumberTextFieldFlag = '🇸🇦';
    phoneNumberTextFieldCode = '966';
    phoneNumberTextFieldController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _displayAppbar() => AppBar(
          automaticallyImplyLeading: false,
        );

    Widget _displayHeading() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            IntroHeading(heading: 'Mediminder App'),
          ],
        );

    Widget _displayBodyText() => Center(
            child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: ScreenConfig.theme.textTheme.bodyText1,
            children: <TextSpan>[
              TextSpan(
                  text:
                      'We are excited to have you on-board. Please enter your number to proceed',
                  // 'We Are Excited To Have You On Board. Please\nenter your number to proceed',
                  style: ScreenConfig.theme.textTheme.bodyText1),
            ],
          ),
        ));

    // Widget _displayCountryCodeTextField() => Column(
    //       children: [
    //         Container(
    //           decoration: BoxDecoration(
    //               // border: Border.all(color: Colors.grey.shade400),
    //               color: Colors.grey.shade100,
    //               borderRadius: BorderRadius.circular(5.0)),
    //           width: ScreenConfig.screenSizeWidth * 0.33,
    //           height: ScreenConfig.screenSizeHeight * 0.07,
    //           child: Padding(
    //             padding: EdgeInsets.symmetric(
    //                 horizontal: ScreenConfig.screenSizeWidth * 0.035),
    //             child: Row(
    //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               children: [
    //                 Text(flag, style: ScreenConfig.theme.textTheme.headline2),
    //                 Text(
    //                   '+' + code,
    //                   style: ScreenConfig.theme.textTheme.headline6,
    //                 ),
    //                 const Icon(
    //                   Icons.keyboard_arrow_down,
    //                   color: Colors.black,
    //                 )
    //               ],
    //             ),
    //           ),
    //         ),
    //       ],
    //     );

    // Widget _displayCountryCodeSection() => GestureDetector(
    //       onTap: () {
    //         showCountryPicker(
    //             context: context,
    //             // favorite: ['SA'],
    //             countryFilter: ['SA'],
    //             countryListTheme: CountryListThemeData(
    //               flagSize: 25,
    //               backgroundColor: Colors.white,
    //               textStyle: TextStyle(
    //                   fontSize:
    //                       ScreenConfig.theme.textTheme.headline6!.fontSize,
    //                   color: Colors.black,
    //                   fontWeight: FontWeight.normal),
    //               borderRadius: const BorderRadius.only(
    //                 topLeft: Radius.circular(20.0),
    //                 topRight: Radius.circular(20.0),
    //               ),
    //               bottomSheetHeight: ScreenConfig.screenSizeHeight * 0.5,
    //               inputDecoration: InputDecoration(
    //                 labelText: 'Search',
    //                 hintText: 'Start typing to search',
    //                 prefixIcon: const Icon(Icons.search),
    //                 border: OutlineInputBorder(
    //                   borderSide: BorderSide(
    //                     color: const Color(0xFF000000).withOpacity(1),
    //                   ),
    //                 ),
    //               ),
    //             ),
    //             onSelect: (val) {
    //               setState(() {
    //                 flag = val.flagEmoji;
    //                 code = val.phoneCode;
    //               });
    //             });
    //       },
    //       child: _displayCountryCodeTextField(),
    //     );

    // Widget _displayPhoneTextField() => Container(
    //     decoration: BoxDecoration(
    //         color: Colors.grey.shade100,
    //         borderRadius: BorderRadius.all(
    //           Radius.circular(5),
    //         )),
    //     width: ScreenConfig.screenSizeWidth * 0.57,
    //     height: ScreenConfig.screenSizeHeight * 0.07,
    //     child: Center(
    //       child: TextFormField(
    //         onChanged: (val) {
    //           if (val.length >= 10) {
    //             setState(() {
    //               error = false;
    //             });
    //             FocusScope.of(context).unfocus();
    //           } else if (val.length < 10) {
    //             setState(() {
    //               error = true;
    //             });
    //           }
    //         },
    //         controller: phoneNum,
    //         inputFormatters: [
    //           LengthLimitingTextInputFormatter(10),
    //           FilteringTextInputFormatter.digitsOnly
    //         ],
    //         onSaved: (val) => phone = val!.trim(),
    //         // validator: (val) => val != null
    //         //     ? val.trim().length != 10
    //         //         ? "Enter Valid Phone Number"
    //         //         : null
    //         //     : null,
    //         // validator: (val) {
    //         //   // if (val != null) {
    //         //   if (validatePhoneNumberField(val)) {
    //         //     setState(() {
    //         //       error = true;
    //         //     });
    //         //   } else {
    //         //     setState(() {
    //         //       error = false;
    //         //     });
    //         //   }
    //         //   // }
    //         //   // return null;
    //         // },
    //         keyboardType: TextInputType.number,
    //         style: ScreenConfig.theme.textTheme.headline6,
    //         maxLines: 1,
    //         minLines: 1,
    //         cursorColor: Colors.black,
    //         // autovalidateMode: AutovalidateMode.onUserInteraction,
    //         decoration: InputDecoration(
    //           focusedBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //             borderSide: BorderSide(color: Colors.grey.shade100),
    //           ),
    //           focusedErrorBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //             borderSide: BorderSide(color: Colors.grey.shade100),
    //           ),
    //           border: OutlineInputBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //             borderSide: BorderSide(color: Colors.grey.shade100),
    //           ),
    //           enabledBorder: OutlineInputBorder(
    //             borderRadius: BorderRadius.all(Radius.circular(5.0)),
    //             borderSide: BorderSide(color: Colors.grey.shade100),
    //           ),
    //           fillColor: Colors.grey.shade100,
    //           filled: true,
    //           contentPadding: const EdgeInsets.only(
    //               left: 15, top: 10, bottom: 10, right: 15),
    //           hintText: '920 000 0000',
    //           hintStyle:
    //               ScreenConfig.theme.textTheme.headline6?.merge(TextStyle(
    //             color: ScreenConfig.theme.colorScheme.secondary,
    //           )),
    //         ),
    //       ),
    //     ));

    Widget _displayTipText() => Text(
          'We will send you an SMS OTP on this number for verification',
          style: ScreenConfig.theme.textTheme.bodyText1?.copyWith(
              color: Colors.grey.shade600, fontWeight: FontWeight.w400),
        );

    Widget _displayBody() {
      return SafeArea(
        child: Container(
          height: ScreenConfig.screenSizeHeight,
          padding: EdgeInsets.symmetric(
              horizontal: ScreenConfig.screenSizeWidth * 0.04),
          width: ScreenConfig.screenSizeWidth,
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.03,
                ),
                _displayHeading(),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.03,
                ),
                _displayBodyText(),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.03,
                ),
                Text('Enter Number',
                    style: ScreenConfig.theme.textTheme.headline6),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.03,
                ),
                const PhoneNumberTextFieldToShow(),
                // Column(
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     Row(
                //       crossAxisAlignment: CrossAxisAlignment.center,
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         _displayCountryCodeSection(),
                //         _displayPhoneTextField(),
                //       ],
                //     ),
                //     error == true
                //         ? Padding(
                //             padding: const EdgeInsets.only(top: 8.0),
                //             child:
                //                 errorHeading('Phone number is not correct'),
                //           )
                //         : const SizedBox(),
                //   ],
                // ),
                SizedBox(
                  height: ScreenConfig.screenSizeHeight * 0.03,
                ),
                _displayTipText(),
                // const Spacer(),

                // SizedBox(
                //   height: ScreenConfig.screenSizeHeight * 0.03,
                // ),
              ],
            ),
          ),
        ),
      );
    }

    // return BlocConsumer<UserBloc, UserState>(
    //   listener: (context, state) {
    //     if (state is LogInError) {
    //       // print('Error log in Scaffold');
    //       // print(state.error);
    //     } else if (state is UserVerify) {
    //       if (state.shouldPush == true) {
    //         //
    //         // Navigator.of(context).pushNamed(OTPVerificationScreen.routeName);
    //         // Navigator.pushNamed(
    //         //               context, OTPVerificationScreen.routeName,
    //         //               arguments: {'number': code + phone});
    //         Navigator.push(
    //           context,
    //           MaterialPageRoute(
    //               builder: (context) => OTPVerificationScreen(
    //                   mobileNum: phoneNumberTextFieldController.text)),
    //         );
    //       }

    //       if (state.shouldPush == false) {
    //         Navigator.of(context).pushNamed(NumberRegistrationScreen.routeName);
    //       }
    //     } else if (state is UserResentOTPVerify) {
    //       print('im here');
    //       if (state.shouldPush == true) {
    //         //
    //         // Navigator.of(context).pushNamed(OTPVerificationScreen.routeName);
    //         // Navigator.pushNamed(
    //         //               context, OTPVerificationScreen.routeName,
    //         //               arguments: {'number': code + phone});
    //         // Navigator.push(
    //         //   context,
    //         //   MaterialPageRoute(
    //         //       builder: (context) =>
    //         //           OTPVerificationScreen(mobileNum: phone)),
    //         // );
    //       }

    //       if (state.shouldPush == false) {
    //         Navigator.of(context).pushNamed(NumberRegistrationScreen.routeName);
    //       }
    //     }
    //   },
    //   builder: (context, state) {
    return Scaffold(
      // appBar: _displayAppbar(),
      body: _displayBody(),
      floatingActionButton: Buttons.fullWidthButton(
          text: 'Continue',
          func: () {
            if (phoneNumberTextFieldController.text.isNotEmpty) {
              if (phoneNumberErrorShownWithTextField == false) {
                // print(error);
                setState(() {
                  phoneNumberErrorShownWithTextField = false;
                });
                // _formkey.currentState!.save();
                // print(phone);
                // BlocProvider.of<UserBloc>(context).add(Signin(
                //     phoneNum: phoneNumberTextFieldController.text));
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => OTPVerificationScreen(
                          mobileNum: phoneNumberTextFieldController.text)),
                );
              } else {
                setState(() {
                  phoneNumberErrorShownWithTextField = true;
                });

                FocusScope.of(context).unfocus();
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  showSnackbar("Please don't leave the field empty"));
            }
          }),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
