import 'package:flutter/material.dart';
import 'package:musium/core/presentation/widgets/press_scale_transition.dart';
import 'package:musium/core/theme/app_typography.dart';
import 'package:musium/features/home/presentation/widget/half_circle.dart';

class MixesCard extends StatelessWidget {
  const MixesCard({
    required this.imagePath,
    required this.title,
    required this.onPressed,
    required this.dimension,
    super.key,
  });

  final VoidCallback onPressed;
  final String title;
  final String imagePath;
  final double dimension;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: dimension,
        maxWidth: dimension,
        minHeight: dimension,
        minWidth: dimension,
      ),
      child: PressScaleTransition(
        onPressed: onPressed,
        child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              imagePath, 
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: dimension * 0.02,
            left: -13.0,
            child: const HalfCircle(
              radius: 13.0,
              type: CircleHalfType.right,
            ),
          ),
          Positioned(
            top: dimension * 0.34,
            right: 35.0,
            child: const HalfCircle(
              radius: 35.0,
              type: CircleHalfType.left,
            ),
          ),
          Positioned(
            top: dimension * 0.06,
            left: dimension * 0.16,
            child: Text(title, style: AppTypography.centuryGothicBold15,),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: SizedBox(
                height: dimension * 0.053,
                child: const ColoredBox(
                  color: Color(0xffFF7777),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}