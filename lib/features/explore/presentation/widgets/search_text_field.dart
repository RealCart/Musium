import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musium/core/constants/app_assets.dart';
import 'package:musium/core/theme/app_colors.dart';
import 'package:musium/core/theme/app_typography.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    this.hintText,
    super.key,
  });

  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: AppTypography.centuryGothicRegular13Grey,
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(
          AppAssets.icons.searchLoupe,
          fit: .scaleDown,
        ),
        contentPadding: const EdgeInsets.fromLTRB(
          7.0,
          10.0,
          10.0,
          10.0,
        ),
        fillColor: AppColors.circleColor,
        filled: true,
        hintText: hintText,
        hintStyle: AppTypography.centuryGothicRegular13Grey,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
      ),
    );
  }
}
