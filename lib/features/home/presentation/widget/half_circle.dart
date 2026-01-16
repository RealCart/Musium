import 'dart:math';

import 'package:flutter/widgets.dart';
import 'package:musium/core/theme/app_colors.dart';

enum CircleHalfType {
  left,
  right,
}

class HalfCircle extends StatelessWidget {
  const HalfCircle({
    required this.radius,
    this.type = CircleHalfType.right,
    this.color,
    super.key,
  });

  final double radius;
  final CircleHalfType type;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _HalfCircleCustomPainter(
        radius: radius, 
        color: color ?? AppColors.circleColor,
        type: type,
      ),
    );
  }
}

class _HalfCircleCustomPainter extends CustomPainter {
  const _HalfCircleCustomPainter({
    required this.radius,
    required this.type,
    required this.color,
  });

  final double radius;
  final Color color;
  final CircleHalfType type;

  @override
  void paint(Canvas canvas, Size size) {
    final double dimension = radius * 2;
    final Rect rect = Offset.zero & Size(dimension, dimension);

    late final double startAngle;
    late final double sweepAngle;

    switch (type) {
      case CircleHalfType.left:
        startAngle = pi / 2;
        sweepAngle = pi;
      case CircleHalfType.right:
        startAngle = 3 * pi / 2;
        sweepAngle = pi;
    }

    final Paint paint = Paint()..color = color..style = .fill;

    canvas.drawArc(rect, startAngle, sweepAngle, true, paint);
  }

  @override
  bool shouldRepaint(covariant _HalfCircleCustomPainter oldDelegate) {
    return false;
  }
}