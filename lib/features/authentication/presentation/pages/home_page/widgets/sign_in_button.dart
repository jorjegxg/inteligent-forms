import 'package:flutter/material.dart';
import 'package:inteligent_forms/core/constants/font_constants.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/constants/string_constants.dart';
import '../../login_page/login_page.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22.sp),
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const LoginPage(),
          ),
        );
      },
      color: Theme.of(context).colorScheme.onPrimary,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 1.2.h,
        ),
        child: Text(
          AppStringConstants.signIn,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: FontConstants.mediumFontSize,
          ),
        ),
      ),
    );
  }
}
