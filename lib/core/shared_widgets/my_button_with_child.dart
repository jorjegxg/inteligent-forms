import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyButtonWithChild extends StatelessWidget {
  const MyButtonWithChild({
    super.key,
    required this.child,
    required this.onPressed,
    this.width,
    this.isLoading = false,
    this.color,
  });

  final Widget child;
  final VoidCallback onPressed;
  final double? width;
  final bool isLoading;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: isLoading ? () {} : onPressed,
      minWidth: width ?? double.infinity,
      height: 6.h,
      color: color ?? Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.sp),
      ),
      child: !isLoading
          ? child
          : CircularProgressIndicator(
              color: Theme.of(context).colorScheme.onPrimary,
            ),
    );
  }
}
