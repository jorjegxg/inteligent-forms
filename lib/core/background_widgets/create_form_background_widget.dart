import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF01949A);
const Color kSecondaryColor = Color(0xFF004369);

class CreateFormBackGroundWidget extends StatelessWidget {
  const CreateFormBackGroundWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: kPrimaryColor,
        ),
        child: CustomPaint(
          painter: BackgroundPainter(),
          child: child,
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var height = size.height;
    var width = size.width;
    final Paint paint = Paint()
      ..color = kSecondaryColor.withOpacity(0.8)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

    canvas.drawCircle(Offset(width * 0.5, height * 0.1), width * 0.45, paint);
    canvas.drawCircle(Offset(width * 0.5, height), width * 0.5, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
