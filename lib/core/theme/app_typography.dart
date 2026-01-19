import 'package:flutter/material.dart';
import 'package:musium/core/constants/app_constants.dart';
import 'package:musium/core/theme/app_colors.dart';

extension TextStyleEx on TextStyle {
  TextStyle setColor(Color color) => copyWith(color: color);
}

class AppTypography {
  AppTypography._();

  static const TextStyle centuryGothicBold27 = TextStyle(
    fontSize: 27.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.colorScheme3,
  );

  static const TextStyle centuryGothicBold24 = TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.white,
  );

  static const TextStyle centuryGothicBold16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.text2,
  );

  static const TextStyle centuryGothicBold15 = TextStyle(
    fontSize: 15.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.white,
  );

  static const TextStyle centuryGothicBold14 = TextStyle(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.text3,
  );

  static const TextStyle centuryGothicRegular13 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.text4,
  );

  static const TextStyle centuryGothicRegular12 = TextStyle(
    fontSize: 12.0,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.white,
  );

  static const TextStyle centuryGothicRegular13Grey = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.text2,
  );

  static const TextStyle centuryGothicBold13 = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.text2,
  );

  static const TextStyle centuryGothicBold11 = TextStyle(
    fontSize: 11.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppConstants.centuryGothic,
    color: AppColors.colorScheme3,
  );

  static const TextStyle centuryGothicBold20 = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    fontFamily: AppConstants.centuryGothic,
  );

  static const TextStyle centuryGothicBold10 = TextStyle(
    fontSize: 10.0,
    fontWeight: FontWeight.bold,
    color: AppColors.white,
    fontFamily: AppConstants.centuryGothic,
  );

  static const TextStyle mullishBold16 = TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    fontFamily: AppConstants.mullish,
    color: AppColors.white,
  );
}
