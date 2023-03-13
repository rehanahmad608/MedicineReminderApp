import 'package:flutter/material.dart';
import '../../../infrastructure/screen_size_config/screen_size_config.dart';

class Buttons {
  static Color btnGreen = const Color(0xff159C2A);
  static Color btnLightBlue = const Color(0xffDEEDFF);
  static Color btnLightGreen = const Color(0xffE6FFE5);
  static Color btnLightOrange = const Color(0xffFFF2E4);
  static Color btnOrange = const Color(0xffDE851E);
  static Color btnLightRed = const Color(0xffFFDEDE);
  static Color btnRed = const Color(0xffDC3535);
  static Widget smallButton(
      {required BuildContext context,
      required String route,
      required Color color,
      Color? textColor,
      required String text}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height: ScreenConfig.screenSizeHeight * 0.055,
        width: ScreenConfig.screenSizeWidth * 0.45,
        padding: EdgeInsets.fromLTRB(ScreenConfig.screenSizeWidth * 0.05, 0,
            ScreenConfig.screenSizeWidth * 0.05, 0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(5.0)),
        child: Center(
            child: Text(
          text,
          style: ScreenConfig.theme.textTheme.headline6
              ?.copyWith(color: textColor, fontWeight: FontWeight.normal),
        )),
      ),
    );
  }

  static Widget smallButtonWithoutBackground(
      {required BuildContext context,
      required String route,
      required String text}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height: ScreenConfig.screenSizeHeight * 0.06,
        width: ScreenConfig.screenSizeWidth * 0.4,
        padding: EdgeInsets.fromLTRB(ScreenConfig.screenSizeWidth * 0.07, 0,
            ScreenConfig.screenSizeWidth * 0.07, 0),
        decoration: BoxDecoration(
            // color: Colors.grey.shade900,
            border: Border.all(color: Colors.grey.shade900),
            borderRadius: BorderRadius.circular(9.0)),
        child: Center(
            child: Text(
          text,
          style: ScreenConfig.theme.textTheme.headline6?.copyWith(
              color: Colors.grey.shade900, fontWeight: FontWeight.normal),
        )),
      ),
    );
  }

  static Widget smallButtonWithoutBackgroundWithIcon(
      {required BuildContext context,
      required String route,
      required IconData iconData,
      required String text}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height: ScreenConfig.screenSizeHeight * 0.05,
        padding: EdgeInsets.fromLTRB(ScreenConfig.screenSizeWidth * 0.06, 0,
            ScreenConfig.screenSizeWidth * 0.06, 0),
        decoration: BoxDecoration(
            // color: Colors.grey.shade900,
            border: Border.all(color: Colors.grey.shade900),
            borderRadius: BorderRadius.circular(12.0)),
        child: Center(
            child: Row(
          children: [
            Icon(iconData),
            SizedBox(
              width: ScreenConfig.screenSizeWidth * 0.02,
            ),
            Text(
              text,
              style: ScreenConfig.theme.textTheme.headline6?.copyWith(
                  color: Colors.grey.shade900, fontWeight: FontWeight.normal),
            ),
          ],
        )),
      ),
    );
  }

  static Widget smallButtonWithBackgroundWithIcon(
      {required BuildContext context,
      Color? color,
      required String route,
      required IconData iconData,
      required String text}) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        height: ScreenConfig.screenSizeHeight * 0.05,
        padding: EdgeInsets.fromLTRB(ScreenConfig.screenSizeWidth * 0.06, 0,
            ScreenConfig.screenSizeWidth * 0.06, 0),
        decoration: BoxDecoration(
            color: color ?? Colors.grey.shade900,
            border: Border.all(color: color ?? Colors.grey.shade900),
            borderRadius: BorderRadius.circular(12.0)),
        child: Center(
            child: Row(
          children: [
            Icon(
              iconData,
              color: Colors.white,
            ),
            SizedBox(
              width: ScreenConfig.screenSizeWidth * 0.02,
            ),
            Text(
              text,
              style: ScreenConfig.theme.textTheme.headline6?.copyWith(
                  color: Colors.white, fontWeight: FontWeight.normal),
            ),
          ],
        )),
      ),
    );
  }

  static Widget fullwidthButton(
          {String? image,
          required Function() func,
          required String text,
          bool hasImage = false}) =>
      GestureDetector(
        onTap: func,
        child: Container(
          width: ScreenConfig.screenSizeWidth,
          height: ScreenConfig.screenSizeHeight * 0.05,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(5.0),
            color: const Color.fromARGB(255, 183, 211, 183),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasImage
                  ? Image.asset(
                      image!,
                      fit: BoxFit.fitWidth,
                      height: ScreenConfig.screenSizeHeight * 0.09,
                      width: ScreenConfig.screenSizeWidth * 0.08,
                    )
                  : const SizedBox(),
              SizedBox(
                width: ScreenConfig.screenSizeWidth * 0.02,
              ),
              Text(
                text,
                style: ScreenConfig.theme.textTheme.bodyText1
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      );

  static Widget fullwidthbutton(
          {String? image,
          required Function() func,
          required String text,
          bool hasImage = false}) =>
      GestureDetector(
        onTap: func,
        child: Container(
          width: ScreenConfig.screenSizeWidth,
          height: ScreenConfig.screenSizeHeight * 0.05,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5.0),
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasImage
                  ? Image.asset(
                      image!,
                      fit: BoxFit.fitWidth,
                      height: ScreenConfig.screenSizeHeight * 0.09,
                      width: ScreenConfig.screenSizeWidth * 0.08,
                    )
                  : const SizedBox(),
              SizedBox(
                width: ScreenConfig.screenSizeWidth * 0.02,
              ),
              Text(
                text,
                style: ScreenConfig.theme.textTheme.bodyText1
                    ?.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      );

  static Widget fullWidthButton(
          {String? image,
          double? width,
          required Function() func,
          required String text,
          bool hasImage = false}) =>
      GestureDetector(
        onTap: func,
        child: Container(
          width: width ?? ScreenConfig.screenSizeWidth * 0.94,
          height: ScreenConfig.screenSizeHeight * 0.06,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Color(0xff1560BD),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              hasImage
                  ? Image.asset(
                      image!,
                      fit: BoxFit.fitWidth,
                      height: ScreenConfig.screenSizeHeight * 0.09,
                      width: ScreenConfig.screenSizeWidth * 0.08,
                    )
                  : const SizedBox(),
              SizedBox(
                width: ScreenConfig.screenSizeWidth * 0.02,
              ),
              Text(
                text,
                style: ScreenConfig.theme.textTheme.headline6
                    ?.copyWith(color: Colors.white),
              ),
            ],
          ),
        ),
      );

  static Widget fullWidthRoundedButton(
          {required Function() func, required String text}) =>
      GestureDetector(
        onTap: func,
        child: Container(
          width: ScreenConfig.screenSizeWidth,
          height: ScreenConfig.screenSizeHeight * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Color(0xff1560BD),
          ),
          child: Center(
              child: Text(
            text,
            style: ScreenConfig.theme.textTheme.bodyText1
                ?.copyWith(color: Colors.white),
          )),
        ),
      );

  static Widget fullWidthRoundedButtonWithoutBackground(
          {required Function() func, required String text}) =>
      GestureDetector(
        onTap: func,
        child: Container(
          width: ScreenConfig.screenSizeWidth,
          height: ScreenConfig.screenSizeHeight * 0.05,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            border: Border.all(color: Colors.grey.shade900),
            color: Colors.white,
          ),
          child: Center(
              child: Text(
            text,
            style: ScreenConfig.theme.textTheme.bodyText1
                ?.copyWith(color: Colors.grey.shade900),
          )),
        ),
      );
}

Widget buttontext(
    Color color, String text, Color textColor, Color borderColor) {
  return Container(
    height: ScreenConfig.screenSizeHeight * 0.06,
    width: ScreenConfig.screenSizeWidth * 0.45,
    padding: EdgeInsets.fromLTRB(ScreenConfig.screenSizeWidth * 0.07, 0,
        ScreenConfig.screenSizeWidth * 0.07, 0),
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5.0),
        border: Border.all(color: borderColor)),
    child: Center(
        child: Text(
      text,
      style: ScreenConfig.theme.textTheme.headline6
          ?.copyWith(color: textColor, fontWeight: FontWeight.normal),
    )),
  );
}

Widget nextButton() {
  return Container(
      width: ScreenConfig.screenSizeWidth * 0.46,
      height: ScreenConfig.screenSizeHeight * 0.08,
      color: Colors.white,
      padding: EdgeInsets.symmetric(
          vertical: ScreenConfig.screenSizeHeight * 0.01,
          horizontal: ScreenConfig.screenSizeWidth * 0.01),
      child: buttontext(
        Color(0xff1560BD),
        "Create Order",
        Colors.white,
        Color(0xff1560BD),
      ));
}

Widget cancelButton(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    child: Container(
        width: ScreenConfig.screenSizeWidth * 0.46,
        height: ScreenConfig.screenSizeHeight * 0.08,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: ScreenConfig.screenSizeHeight * 0.01,
            horizontal: ScreenConfig.screenSizeWidth * 0.01),
        child: buttontext(
            Buttons.btnLightRed, "Cancel", Buttons.btnRed, Buttons.btnRed)),
  );
}

Widget nextButtonWithFunction(void Function() func) {
  return GestureDetector(
    onTap: func,
    child: Container(
        width: ScreenConfig.screenSizeWidth * 0.46,
        height: ScreenConfig.screenSizeHeight * 0.08,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: ScreenConfig.screenSizeHeight * 0.01,
            horizontal: ScreenConfig.screenSizeWidth * 0.01),
        child: buttontext(
          Color(0xff1560BD),
          "Next",
          Colors.white,
          Color(0xff1560BD),
        )),
  );
}

Widget cancelButtonWithFunction(BuildContext context, void Function() func) {
  return InkWell(
    onTap: func,
    child: Container(
        width: ScreenConfig.screenSizeWidth * 0.46,
        height: ScreenConfig.screenSizeHeight * 0.08,
        color: Colors.white,
        padding: EdgeInsets.symmetric(
            vertical: ScreenConfig.screenSizeHeight * 0.01,
            horizontal: ScreenConfig.screenSizeWidth * 0.01),
        child: buttontext(
            Buttons.btnLightRed, "Cancel", Buttons.btnRed, Buttons.btnRed)),
  );
}
