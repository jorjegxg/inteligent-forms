import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF01949A);
const Color kSecondaryColor = Color(0xFF004369);

class FormsBackGroundWidget extends StatelessWidget {
  const FormsBackGroundWidget({
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
    var height = size.height;
    var width = size.width;
    final Paint paint = Paint()..color = kSecondaryColor;
    final Path path1 = Path();

    path1.moveTo(width, 0);
    path1.lineTo(width * 0.95, 0);
    path1.lineTo(width * 0.5, height * 0.85);
    path1.lineTo(width, height * 0.7);

    path1.close();

    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
