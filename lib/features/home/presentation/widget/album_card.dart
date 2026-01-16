import 'package:flutter/material.dart';
import 'package:musium/core/presentation/widgets/press_scale_transition.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    required this.onPressed,
    required this.imagePath,
    required this.name,
    super.key,
  });

  final VoidCallback onPressed;
  final String imagePath;
  final String name;

  @override
  Widget build(BuildContext context) {
    return PressScaleTransition(
      onPressed: onPressed,
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.albumCard,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
            topLeft: Radius.circular(3.0),
            bottomLeft: Radius.circular(3.0),
          )
        ),
        child: Row(
          children: [
            SizedBox(
              height: double.infinity,
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 14.0),
            Align(
              alignment: Alignment.center,
              child: Text(
                name,
                style: AppTypography.centuryGothicBold10,
              ),
            )
          ],
        ),
      ),
    );
  }
}