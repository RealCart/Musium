import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:musium/core/theme/app_colors.dart';

class ProfileCircleAvatar extends StatelessWidget {
  const ProfileCircleAvatar({
    super.key,    
    this.child,
    this.radius = 17.0,
    this.borderWidth = 2.5,
  });

  final Widget? child;
  final double radius;
  final double borderWidth;

  @override
  Widget build(BuildContext context) {
    
    log("Rebuild...", name: "ProfileCircleAvatar");
    return CustomPaint(
      painter: _ProfileCircleAvatarCustomPainter(
        radius: radius,
        borderWidth: borderWidth,
      ),
      child: SizedBox.square(
        dimension: radius * 2.0,
        child: ClipOval(
          clipBehavior: Clip.hardEdge,
          child: child,
        ),
      ),
    );
  }
}

class _ProfileCircleAvatarCustomPainter extends CustomPainter {
  const _ProfileCircleAvatarCustomPainter({
    required this.radius,
    required this.borderWidth,
  });

  final double borderWidth;
  final double radius;
  
  
  @override
  void paint(Canvas canvas, Size size) {
    final double dimension = radius * 2;
    final Rect rect = Offset.zero & Size(dimension, dimension);
    final Offset center = rect.center;

    log("$center", name: "Center value");

    final innerRadius = radius;
    final outerRadius = innerRadius + borderWidth;

    log("$innerRadius", name: "Ineer radius value");
    log("$outerRadius", name: "Outer radius value");

    const LinearGradient linearGradient = LinearGradient(
      begin: .topLeft,
      end: .bottomRight,
      stops: [0.0, 1.0],
      colors: [
        AppColors.circleGradientColor1,
        AppColors.circleGradientColor2,
      ],
    );

    final borderPaint = Paint()..shader = linearGradient.createShader(rect)..style = .stroke..strokeWidth = borderWidth;

    canvas.drawCircle(center, outerRadius, borderPaint);

    final paint = Paint()
      ..color = AppColors.transparent
      ..style = PaintingStyle.fill;
    
    canvas.drawCircle(center, innerRadius, paint);
  }
  
  @override
  bool shouldRepaint(covariant _ProfileCircleAvatarCustomPainter oldDelegate) {
    return oldDelegate.borderWidth != borderWidth || oldDelegate.radius != radius;
  }  
}
