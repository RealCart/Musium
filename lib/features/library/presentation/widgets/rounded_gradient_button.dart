import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/core/presentation/widgets/press_scale_transition.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class RoundedGradientButton extends StatelessWidget {
  const RoundedGradientButton({
    required this.path,
    required this.title,
    required this.onPressed,
    super.key,
  });

  final String path;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return PressScaleTransition(
      onPressed: onPressed,
      child: Row(
        children: [
          Container(
            padding: const .symmetric(
              horizontal: 18.0,
              vertical: 18.5,
            ),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [
                  0.0,
                  1.0,
                ],
                colors: [
                  Color(0xffA6F3FF),
                  Color(0xff00C2CB),
                ],
              ),
            ),
            child: SvgPicture.asset(
              path,
              fit: BoxFit.cover,
              colorFilter: const ColorFilter.mode(
                AppColors.black,
                BlendMode.srcIn,
              ),
            ),
          ),
          const SizedBox(width: 26.0),
          Expanded(
            child: Text(
              title,
              style: AppTypography.centuryGothicBold20,
            ),
          ),
        ],
      ),
    );
  }
}
