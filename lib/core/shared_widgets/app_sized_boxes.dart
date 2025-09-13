import 'package:flutter/cupertino.dart';
import 'package:sizer/sizer.dart';

class AppSizedBoxes {
  static SizedBox kSmallBox() {
    return SizedBox(
      height: 1.h,
    );
  }

  static SizedBox kMediumBox() {
    return SizedBox(
      height: 3.h,
    );
  }

  static SizedBox kHSmallBox() {
    return SizedBox(
      width: 3.w,
    );
  }

  static SizedBox kHMediumBox() {
    return SizedBox(
      width: 2.w,
    );
  }
}
