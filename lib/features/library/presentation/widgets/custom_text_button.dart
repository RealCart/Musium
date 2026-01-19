import 'package:flutter/material.dart';
import 'package:musium/core/presentation/widgets/press_scale_transition.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    required this.title,
    required this.isSelected,
    required this.onPressed,
    super.key,
  });

  final String title;
  final bool isSelected;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PressScaleTransition(
      onPressed: onPressed,
      child: Container(
        padding: const .symmetric(horizontal: 10.0),
        decoration: BoxDecoration(
          gradient: isSelected
              ? const LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                    0.0,
                    1.0,
                  ],
                  colors: [
                    Color(0xff1797A8),
                    Color(0xff00C2CB),
                  ],
                )
              : null,
          color: isSelected ? null : AppColors.transparent,
          border: isSelected
              ? null
              : Border.all(
                  color: AppColors.white,
                ),
          borderRadius: const BorderRadius.all(Radius.circular(23.0)),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Text(
            title,
            style: AppTypography.centuryGothicRegular12,
          ),
        ),
      ),
    );
  }
}
