import 'package:flutter/material.dart';

import '../constants/font_constants.dart';

class MySnackBar extends SnackBar {
  MySnackBar({
    super.key,
    required this.text,
  }) : super(
          behavior: SnackBarBehavior.fixed,
          content: Text(
            text,
            style: TextStyle(
              fontSize: FontConstants.smallFontSize,
            ),
          ),
        );

  final String text;
}

showMySnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    MySnackBar(text: text),
  );
}
