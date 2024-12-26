import 'package:flutter/material.dart';

class TrucoTriangleDrawer extends StatelessWidget {
  final double size;
  final int globalScore;
  final int relativeMaxScore;

  const TrucoTriangleDrawer({
    super.key,
    required this.size,
    required this.globalScore,
    required this.relativeMaxScore,
  });

  int get howManySticks {
    // Full triangle case
    if (globalScore >= relativeMaxScore) return 3;
    
    // Empty triangle case
    if (relativeMaxScore - globalScore >= 3) return 0;

    // Incomplete triangle case
    return 3 - (relativeMaxScore - globalScore);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        color: Colors.transparent,
        width: size,
        height: size,
        child: CustomPaint(
          painter: TrianglePainter(howManySticks),
        ),
      ),
    );
  }
}

class TrianglePainter extends CustomPainter {
  final int score;

  TrianglePainter(this.score);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path()..moveTo(0, size.height);

    switch (score) {
      case 1:
        path.lineTo(size.width / 2, 0);
        break;
      case 2:
        path.lineTo(size.width / 2, 0);
        path.lineTo(size.width, size.height);
        break;
      case 3:
        path.lineTo(size.width / 2, 0);
        path.lineTo(size.width, size.height);
        path.lineTo(0, size.height);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
