import 'package:flutter/material.dart';
import 'package:musium/core/presentation/widgets/press_scale_transition.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    super.key,
    required this.imagePath,
    required this.onPressed,
  });

  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(5.0),
      child: PressScaleTransition(
        onPressed: onPressed,
        child: Image.asset(
          imagePath,
        ), 
      )
    );
  }
}