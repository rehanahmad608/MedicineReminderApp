import 'package:flutter/material.dart';
import 'package:stellar/src/infrastructure/screen_size_config/screen_size_config.dart';
import 'package:stellar/src/presentation/ui/templates/general_padding.dart';

class MyAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final bool hasTitle;
  final bool hasBackButton;
  final IconData leadingIconData;
  final List<Widget> actions;

  @override
  final Size preferredSize;

  MyAppbar(
      {Key? key,
      required this.title,
      required this.hasTitle,
      required this.hasBackButton,
      required this.leadingIconData,
      required this.actions})
      : preferredSize = const Size.fromHeight(50.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      leading: hasBackButton
          ? Padding(
              padding: GeneralPadding.generalPadding(),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(leadingIconData)),
            )
          : const SizedBox(),
      centerTitle: true,
      title: hasTitle
          ? Text(title,
              textAlign: TextAlign.center,
              style: ScreenConfig.theme.textTheme.headline3
                  ?.copyWith(fontWeight: FontWeight.w700))
          : null,
    );
  }
}
