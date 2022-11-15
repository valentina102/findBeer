import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class AppTextStyle {

  AppTextStyle(this.context);
  final BuildContext context;

  TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: 20, //93
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    );
  }
  TextStyle get bottomNavigation {
    return _baseTextStyle.copyWith(fontSize: 10);
  }
  TextStyle get textForm {
    return _baseTextStyle.copyWith(
      fontSize: 16,
      color: AppColors.darkBrown,
    );
  }

  TextStyle get header {
    return _baseTextStyle.copyWith(
      fontSize: 30, //93
      fontWeight: FontWeight.w400,
      color: AppColors.redWine,
    );
  }

  /// BASE
  static const _baseTextStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.normal,
  );
}
