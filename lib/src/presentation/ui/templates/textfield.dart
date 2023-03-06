import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stellar/src/presentation/ui/templates/generic_decorations.dart';

import '../../../infrastructure/screen_size_config/screen_size_config.dart';

class MyTextFields {
  static Widget generalTextField(
          {required String hint,
          String? initialValue,
          Color? hintcolor,
          required final TextEditingController controller,
          final Function(String val)? onChanged,
          final Function()? onEditComplete,
          final Function()? onTap,
          final Function(String?)? onSaved,
          List<TextInputFormatter>? inputFormatters,
          String? Function(String?)? validator,
          final TextInputType? textInputType,
          final bool isReadOnly = false,
          final Widget? suffixIcon}) =>
      Container(
        // width: ScreenConfig.screenSizeWidth * 0.57,
        height: ScreenConfig.screenSizeHeight * 0.07,
        decoration: textFieldContainerDecoration(),
        padding: const EdgeInsets.fromLTRB(5, 0.0, 5, 0),
        child: Center(
          child: TextFormField(
            readOnly: isReadOnly,
            initialValue: initialValue,
            onTap: onTap,
            inputFormatters: inputFormatters,
            keyboardType: textInputType,
            controller: controller,
            validator: validator,
            onSaved: onSaved,
            onChanged: onChanged,
            onEditingComplete: onEditComplete,
            cursorColor: Colors.black,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  borderSide: BorderSide(color: Colors.grey.shade100),
                ),
                errorStyle: const TextStyle(fontSize: 16.0),
                fillColor: Colors.grey.shade100,
                filled: true,
                suffixIcon: suffixIcon,
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                hintText: hint,
                hintStyle: ScreenConfig.theme.textTheme.headline6
                    ?.copyWith(color: hintcolor)),
            style: ScreenConfig.theme.textTheme.headline6
                ?.copyWith(color: Colors.black),
          ),
        ),
      );

  static Widget feedbackTextField(
          {required String hint,
          required final TextEditingController controller,
          final Function(String val)? onChanged,
          final Function()? onEditComplete,
          final Function()? onTap,
          final TextInputType? textInputType}) =>
      Container(
        padding: EdgeInsets.fromLTRB(
            ScreenConfig.screenSizeWidth * 0.05, 0.0, 0.0, 0.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(12.0)),
        child: TextField(
          keyboardType: textInputType,
          controller: controller,
          maxLines: 5,
          onChanged: onChanged,
          onEditingComplete: onEditComplete,
          decoration: InputDecoration(hintText: hint),
        ),
      );

  static Widget chatboxTextField(
          {required String hint,
          required final TextEditingController controller,
          final Function(String val)? onChanged,
          final Function()? onEditComplete,
          final Function()? onTap,
          final TextInputType? textInputType}) =>
      Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenConfig.screenSizeWidth * 0.03,
          ),
          child: Container(
            height: ScreenConfig.screenSizeHeight * 0.15,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                )),
            padding: EdgeInsets.fromLTRB(13, 0.0, 13, 0),
            child: Center(
              child: TextField(
                cursorColor: Colors.black,
                keyboardType: textInputType,
                controller: controller,
                maxLines: 5,
                onChanged: onChanged,
                onEditingComplete: onEditComplete,
                decoration: InputDecoration(
                  hintText: hint,
                  hintStyle:
                      ScreenConfig.theme.textTheme.bodyText1?.merge(TextStyle(
                    color: Colors.grey.shade400,
                  )),
                ),
              ),
            ),
          ));

  static Widget feedbackdetailTextField(
          {required String hint,
          required final TextEditingController controller,
          final Function(String val)? onChanged,
          final Function()? onEditComplete,
          final Function()? onTap,
          final TextInputType? textInputType}) =>
      Container(
        height: ScreenConfig.screenSizeHeight * 0.1,
        padding: EdgeInsets.fromLTRB(
            ScreenConfig.screenSizeWidth * 0.03, 0.0, 0.0, 0.0),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade300),
            borderRadius: BorderRadius.circular(6.0)),
        child: TextField(
          keyboardType: textInputType,
          controller: controller,
          maxLines: 5,
          onChanged: onChanged,
          onEditingComplete: onEditComplete,
          decoration: InputDecoration(hintText: hint),
        ),
      );
}
