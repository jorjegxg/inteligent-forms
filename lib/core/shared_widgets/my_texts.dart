import 'package:flutter/material.dart';
import 'package:inteligent_forms/core/constants/font_constants.dart';

class MyTexts {
  Text largeText({required String text}) => Text(
        text,
        style: TextStyle(
          fontSize: FontConstants.largeFontSize,
        ),
      );

  Text mediumText({required String text}) => Text(
        text,
        style: TextStyle(
          fontSize: FontConstants.mediumFontSize,
        ),
      );

  Text smallText({required String text}) => Text(
        text,
        style: TextStyle(
          fontSize: FontConstants.smallFontSize,
        ),
      );
}
