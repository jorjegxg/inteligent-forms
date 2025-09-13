import 'package:flutter/material.dart';
import 'package:inteligent_forms/core/constants/font_constants.dart';

class MyTextButton extends StatelessWidget {
  const MyTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: FontConstants.mediumFontSize,
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
