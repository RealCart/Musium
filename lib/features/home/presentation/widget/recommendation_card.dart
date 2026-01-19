import 'package:flutter/material.dart';
import 'package:musium/core/presentation/widgets/press_scale_transition.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({
    required this.imagePath,
    required this.onPressed,
    super.key,
  });

  final String imagePath;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PressScaleTransition(
      onPressed: onPressed,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(5.0),
        child: Image.asset(
          imagePath,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
