import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF004369);
const Color kSecondaryColor = Color(0xFFDB1F48);

class LoginBackGroundWidget extends StatelessWidget {
  const LoginBackGroundWidget({
    super.key,
    this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
      ),
      child: CustomPaint(
        painter: BackgroundPainter(),
        child: child,
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = kSecondaryColor;
    final Path path1 = Path();

    var height = size.height;
    var width = size.width;
    path1.moveTo(0, 0);
    path1.lineTo(0, height * 0.4);
    path1.lineTo(width * 0.2, height * 0.45);
    path1.lineTo(width * 0.17, height * 0.2);
    path1.lineTo(width * 0.7, height * 0.2);
    path1.lineTo(width * 0.5, 0);
    path1.close();

    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
