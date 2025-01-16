import 'dart:math';

import 'package:flutter/material.dart';

class FootballProgressIndicator extends StatelessWidget {
final double value;

const FootballProgressIndicator({super.key, required this.value});

@override
Widget build(BuildContext context) {
  return CustomPaint(
    size: const Size(100, 100),
    painter: FootballProgressPainter(value: value),
  );
}
}

class FootballProgressPainter extends CustomPainter {
  final double value;

  FootballProgressPainter({required this.value});

  @override
  void paint(Canvas canvas, Size size) {
    final double radius = size.width / 2;
    final Offset center = Offset(radius, radius);
    final Paint paint = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawCircle(center, radius, paint);

    final double sweepAngle = 2 * pi * value;
    paint.color = Colors.white;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      paint,
    );

    final Paint ballPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    canvas.drawCircle(center, radius * 0.2, ballPaint);

    final Paint spotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;
    final double spotRadius = radius * 0.05;
    final List<Offset> spotPositions = [
      Offset(center.dx - radius * 0.1, center.dy - radius * 0.1),
      Offset(center.dx + radius * 0.1, center.dy - radius * 0.1),
      Offset(center.dx - radius * 0.1, center.dy + radius * 0.1),
      Offset(center.dx + radius * 0.1, center.dy + radius * 0.1),
    ];
    for (Offset position in spotPositions) {
      canvas.drawCircle(position, spotRadius, spotPaint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}