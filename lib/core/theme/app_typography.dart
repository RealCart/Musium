import 'package:flutter/material.dart';
import 'package:musium/core/theme/app_colors.dart';

extension TextStyleEx on TextStyle {
  TextStyle setColor(Color color) => copyWith(color: color);
}

class AppTypography {
  AppTypography._();

    static const TextStyle centuryGothicBold27 = TextStyle(
    fontSize: 27.0,
    fontWeight: FontWeight.w700,
    fontFamily: "Century Gothic",
    color: AppColors.colorScheme3,
  );

  static const TextStyle centuryGothicBold24 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    fontFamily: "Century Gothic",
    color: AppColors.white,
  );

  static const TextStyle centuryGothicBold16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    fontFamily: "Century Gothic",
    color: AppColors.text2,
  );

  static const TextStyle centuryGothicBold14 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    fontFamily: "Century Gothic",
    color: AppColors.text3,
  );

  static const TextStyle centuryGothicRegular13 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    fontFamily: "Century Gothic",
    color: AppColors.text4,
  );

  static const TextStyle centuryGothicBold13 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    fontFamily: "Century Gothic",
    color: AppColors.text2,
  );


  static const TextStyle mullishBold16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    fontFamily: "Mullish",
    color: AppColors.white,
  );
}