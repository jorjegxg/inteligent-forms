import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF01949A);
const Color kSecondaryColor = Color(0xFF004369);

class CreateFieldBackGroundWidget extends StatelessWidget {
  const CreateFieldBackGroundWidget({
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
    final Paint paint = Paint()..color = kSecondaryColor;
    final path = Path();

    path.moveTo(0, height * 0.05);
    path.lineTo(width * 0.4, height * 0.2);
    path.lineTo(width * 0.3, height);
    path.lineTo(0, height * 0.4);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
