import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppConstants {
  static const kLabelStyle = TextStyle(
    fontSize: 18.0,
    color: AppColors.kTextColor,
  );

  static const kNumberStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.w900,
    color: AppColors.kWhiteColor,
  );

  static const kLargeTextStyle = TextStyle(
    fontSize: 20.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kTextColor,
  );

  static const kTitleTextStyle = TextStyle(
    fontSize: 50.0,
    fontWeight: FontWeight.bold,
    color: Colors.black38
  );

  static const kResultTextStyle = TextStyle(
    color: AppColors.kThumbColor,
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
  );

  static const kBMIResultStyle = TextStyle(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
    color: AppColors.kWhiteColor,
  );

  static const kBottomButtonHeight = 80.0;

  static const kResultScreen = '/result_page';
}
