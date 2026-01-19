import 'package:flutter/widgets.dart';
import 'package:musium/core/presentation/widgets/press_scale_transition.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class ExploreCard extends StatelessWidget {
  const ExploreCard({
    required this.title,
    required this.imagePath,
    required this.backgroundColor,
    required this.onPressed,
    super.key,
  });

  final String title;
  final String imagePath;
  final Color backgroundColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double width = constraints.maxWidth;
        final double multiplier = width / 167.0;
        final double padding = multiplier * 14.0;

        return PressScaleTransition(
          onPressed: onPressed,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(
              7.0,
            ),
            child: ColoredBox(
              color: backgroundColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsetsGeometry.only(
                      top: padding,
                      left: padding,
                    ),
                    child: Text(
                      title,
                      style: AppTypography.centuryGothicBold16.setColor(
                        AppColors.white,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform.rotate(
                      angle: 0.471,
                      child: ClipRRect(
                        borderRadius: const BorderRadiusGeometry.all(
                          Radius.circular(3.0),
                        ),
                        child: Image.asset(imagePath),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
