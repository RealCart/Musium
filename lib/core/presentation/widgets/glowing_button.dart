import 'package:flutter/material.dart';
import 'package:musium/core/presentation/widgets/press_scale_transition.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class GlowingButton extends StatelessWidget {
  const GlowingButton({super.key, required this.onPressed, required this.text,});

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PressScaleTransition(
      onPressed: onPressed,
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColors.background3,
          borderRadius:BorderRadius.all(Radius.circular(20.0)),
          boxShadow: [
            BoxShadow(
              color: AppColors.glowingColor,
              spreadRadius: 0.5,
              blurRadius: 10.0,
            )
          ]
        ),
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        child: Text(
          text, 
          style: AppTypography.centuryGothicBold16.setColor(AppColors.white),
        ),
      ),
    );
  }
}