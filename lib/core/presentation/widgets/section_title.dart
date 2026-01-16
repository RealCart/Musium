import 'package:flutter/material.dart';
import 'package:musium/core/theme/app_typography.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: AppTypography.centuryGothicBold20);
  }
}