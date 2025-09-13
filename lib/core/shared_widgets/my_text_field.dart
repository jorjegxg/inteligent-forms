import 'package:flutter/material.dart';
import 'package:inteligent_forms/core/constants/app_number_constants.dart';

import '../constants/font_constants.dart';

class MyTextField extends StatelessWidget {
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.width,
    this.maxLines,
    this.textAlign,
    this.textInputAction,
    this.keyboardType,
    this.onChanged,
    this.onSubmitted,
    // this.onEditingComplete,
  });

  final TextEditingController controller;
  final String hintText;
  final double? width;
  final bool isPassword;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  // final Function(String)? onEditingComplete;
  final Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      child: TextField(
        // onEditingComplete: () => onEditingComplete,
        onSubmitted: onSubmitted,
        onChanged: onChanged,
        keyboardType: keyboardType ?? TextInputType.multiline,
        maxLines: maxLines ?? 1,
        style: Theme.of(context).textTheme.headlineSmall!.copyWith(
              fontSize: FontConstants.smallFontSize,
            ),
        textInputAction: textInputAction ?? TextInputAction.next,
        textAlign: textAlign ?? TextAlign.center,
        controller: controller,
        obscureText: isPassword,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              AppNumberConstants.longTileRadius,
            ),
          ),
          hintText: hintText,
          fillColor: Theme.of(context).colorScheme.onPrimary,
          filled: true,
        ),
      ),
    );
  }
}
