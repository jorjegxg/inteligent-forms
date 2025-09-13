import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF01949A);
const Color kSecondaryColor = Color(0xFF004369);

class PreviewDocBackGroundWidget extends StatelessWidget {
  const PreviewDocBackGroundWidget({
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

    final Path path = Path();
    final Path path1 = Path();

    path.moveTo(0, height * 0.85);
    path.lineTo(width * 0.1, height * 0.95);
    path.lineTo(width * 0.3, height * 0.95);
    path.lineTo(width * 0.2, height);
    path.lineTo(0, height);
    path.close();

    path.moveTo(width, height * 0.85);
    path.lineTo(width * 0.9, height * 0.95);
    path.lineTo(width * 0.7, height * 0.95);
    path.lineTo(width * 0.8, height);
    path.lineTo(width, height);
    path.close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
