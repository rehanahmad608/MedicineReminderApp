import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar/src/infrastructure/screen_size_config/screen_size_config.dart';
import 'package:stellar/src/presentation/ui/templates/validator_error.dart';

bool phoneNumberErrorShownWithTextField = true;
String phoneNumberTextFieldFlag = '🇸🇦';
String phoneNumberTextFieldCode = '966';
TextEditingController phoneNumberTextFieldController = TextEditingController();

class PhoneNumberTextFieldToShow extends StatefulWidget {
  const PhoneNumberTextFieldToShow({Key? key}) : super(key: key);

  @override
  State<PhoneNumberTextFieldToShow> createState() =>
      _PhoneNumberTextFieldToShowState();
}

class _PhoneNumberTextFieldToShowState
    extends State<PhoneNumberTextFieldToShow> {
  @override
  Widget build(BuildContext context) {
    Widget _displayCountryCodeTextField() => Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  // border: Border.all(color: Colors.grey.shade400),
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(5.0)),
              width: ScreenConfig.screenSizeWidth * 0.33,
              height: ScreenConfig.screenSizeHeight * 0.07,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: ScreenConfig.screenSizeWidth * 0.035),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(phoneNumberTextFieldFlag,
                        style: ScreenConfig.theme.textTheme.headline2),
                    Text(
                      '+' + phoneNumberTextFieldCode,
                      style: ScreenConfig.theme.textTheme.headline6,
                    ),
                    const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
          ],
        );

    Widget _displayCountryCodeSection() => GestureDetector(
          onTap: () {
            showCountryPicker(
                context: context,
                // favorite: ['SA'],
                countryFilter: ['SA'],
                countryListTheme: CountryListThemeData(
                  flagSize: 25,
                  backgroundColor: Colors.white,
                  textStyle: TextStyle(
                      fontSize:
                          ScreenConfig.theme.textTheme.headline6!.fontSize,
                      color: Colors.black,
                      fontWeight: FontWeight.normal),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  bottomSheetHeight: ScreenConfig.screenSizeHeight * 0.5,
                  inputDecoration: InputDecoration(
                    labelText: 'Search',
                    hintText: 'Start typing to search',
                    prefixIcon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: const Color(0xFF000000).withOpacity(1),
                      ),
                    ),
                  ),
                ),
                onSelect: (val) {
                  setState(() {
                    phoneNumberTextFieldFlag = val.flagEmoji;
                    phoneNumberTextFieldCode = val.phoneCode;
                  });
                });
          },
          child: _displayCountryCodeTextField(),
        );

    Widget _displayPhoneTextField() => Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: const BorderRadius.all(
              Radius.circular(5),
            )),
        width: ScreenConfig.screenSizeWidth * 0.57,
        height: ScreenConfig.screenSizeHeight * 0.07,
        child: Center(
          child: TextFormField(
            onChanged: (val) {
              if (val.length >= 10) {
                setState(() {
                  phoneNumberErrorShownWithTextField = false;
                });
                FocusScope.of(context).unfocus();
              } else if (val.length < 10) {
                setState(() {
                  phoneNumberErrorShownWithTextField = true;
                });
              }
            },
            controller: phoneNumberTextFieldController,
            inputFormatters: [
              LengthLimitingTextInputFormatter(10),
              FilteringTextInputFormatter.digitsOnly
            ],
            // onSaved: (val) => phone = val!.trim(),
            // validator: (val) => val != null
            //     ? val.trim().length != 10
            //         ? "Enter Valid Phone Number"
            //         : null
            //     : null,
            // validator: (val) {
            //   // if (val != null) {
            //   if (validatePhoneNumberField(val)) {
            //     setState(() {
            //       error = true;
            //     });
            //   } else {
            //     setState(() {
            //       error = false;
            //     });
            //   }
            //   // }
            //   // return null;
            // },
            keyboardType: TextInputType.number,
            style: ScreenConfig.theme.textTheme.headline6,
            maxLines: 1,
            minLines: 1,
            cursorColor: Colors.black,
            // autovalidateMode: AutovalidateMode.onUserInteraction,
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.grey.shade100),
              ),
              fillColor: Colors.grey.shade100,
              filled: true,
              contentPadding: const EdgeInsets.only(
                  left: 15, top: 10, bottom: 10, right: 15),
              hintText: '920 000 0000',
              hintStyle:
                  ScreenConfig.theme.textTheme.headline6?.merge(TextStyle(
                color: ScreenConfig.theme.colorScheme.secondary,
              )),
            ),
          ),
        ));

    Widget displayPhoneNumberTextField() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _displayCountryCodeSection(),
              _displayPhoneTextField(),
            ],
          ),
          phoneNumberErrorShownWithTextField == true
              ? Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: errorHeading('Phone number is not correct'),
                )
              : const SizedBox(),
        ],
      );
    }

    return displayPhoneNumberTextField();
  }
}
