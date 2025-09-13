import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFF01949A);

class LoginBackGroundWidget extends StatelessWidget {
  const LoginBackGroundWidget({
    super.key,
  });

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
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()..color = Colors.white;
    final Path path1 = Path();
    final Path path2 = Path();

    var height = size.height;
    var width = size.width;
    path1.moveTo(width * 0.25, 0);
    path1.lineTo(width * 0.9, height * 0.2);
    path1.lineTo(width, height * 0.2);
    path1.lineTo(width, 0);
    path1.close();

    path2.moveTo(0, height * 0.40);
    path2.lineTo(width * 0.4, height * 0.5);
    path2.lineTo(0, height * 0.60);
    path2.close();

    canvas.drawPath(path1, paint);
    canvas.drawPath(path2, paint);
  }

  @override
  bool shouldRepaint(BackgroundPainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(BackgroundPainter oldDelegate) => false;
}
