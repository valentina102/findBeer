import 'package:find_beer/core/style/app_color.dart';
import 'package:find_beer/core/utils/screen_size.dart';
import 'package:flutter/material.dart';

class AppTextStyle {

  AppTextStyle(this.context);
  final BuildContext context;

  TextStyle get button {
    return _baseTextStyle.copyWith(
      fontSize: ScreenSize.height(context) * 0.026, //93
      fontWeight: FontWeight.w400,
      color: AppColors.white,
    );
  }

  /// BASE
  static const _baseTextStyle = TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.normal,
  );
}
