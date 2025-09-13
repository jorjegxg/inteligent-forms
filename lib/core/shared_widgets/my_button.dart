import 'package:flutter/material.dart';

import '../constants/font_constants.dart';
import 'my_button_with_child.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.width,
    this.isLoading = false,
    this.color,
  });

  final String text;
  final VoidCallback onPressed;
  final double? width;
  final bool isLoading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MyButtonWithChild(
      color: color,
      onPressed: onPressed,
      width: width,
      isLoading: isLoading,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Theme.of(context).colorScheme.onPrimary,
              fontSize: FontConstants.mediumFontSize,
            ),
      ),
    );
  }
}
