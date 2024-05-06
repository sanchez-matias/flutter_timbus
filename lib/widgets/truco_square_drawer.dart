import 'package:flutter/material.dart';

class TrucoSquareDrawer extends StatelessWidget {
  final double size;
  final int globalScore;
  final int relativeMaxScore;

  const TrucoSquareDrawer({
    super.key,
    required this.size,
    required this.globalScore,
    required this.relativeMaxScore,
  });

  int get howManySticks {
    if (globalScore - relativeMaxScore >= 0) {
      return 5;
    } else if ((globalScore > relativeMaxScore - 5) && (globalScore < relativeMaxScore +  5)) {
     return globalScore - (relativeMaxScore - 5);
    } else {
      return 0;
    }
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
          painter: SquarePainter(howManySticks),
        ),
      ),
    );
  }
}

class SquarePainter extends CustomPainter {
  final int score;

  SquarePainter(this.score);

  factory SquarePainter.fullSquare() => SquarePainter(5);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    final path = Path();

    switch (score) {
      case 1:
        path.lineTo(size.height, 0);
        break;
      case 2:
        path.lineTo(size.height, 0);
        path.lineTo(size.height, size.width);
        break;
      case 3:
        path.lineTo(size.height, 0);
        path.lineTo(size.height, size.width);
        path.lineTo(0, size.width);
        break;
      case 4:
        path.lineTo(size.height, 0);
        path.lineTo(size.height, size.width);
        path.lineTo(0, size.width);
        path.lineTo(0, 0);
        break;
      case 5:
        path.lineTo(size.height, 0);
        path.lineTo(size.height, size.width);
        path.lineTo(0, size.width);
        path.lineTo(0, 0);
        path.moveTo(4, 4);
        path.lineTo(size.height, size.width);
        break;
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(SquarePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(SquarePainter oldDelegate) => false;
}
