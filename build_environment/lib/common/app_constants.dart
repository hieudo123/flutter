import 'package:build_environment/common/app_colors.dart';
import 'package:build_environment/common/app_fonts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String kImageUrl = 'https://image.tmdb.org/t/p/w500';

  static const  kLargeTitleTextStyle = TextStyle(
    fontSize: 44.0,
    fontFamily: AppFonts.kProximasoft,
  );

  static const  kNormalTitleTextStyle = TextStyle(
    fontSize: 36.0,
    fontFamily: AppFonts.kProximasoft,
  );

  static const  kSmallTitleTextStyle = TextStyle(
    fontSize: 24.0,
    fontFamily: AppFonts.kProximasoft,
  );

  static const  kSmallTextStyle = TextStyle(
    fontSize: 14.0,
    fontFamily: AppFonts.kProximasoft,
  );

  static const  kNormalTextStyle = TextStyle(
    fontSize: 18.0,
    fontFamily: AppFonts.kProximasoft,
  );

  static const  kSmallRatingTextStyle = TextStyle(
    fontSize: 8.0,
    fontFamily: AppFonts.kProximasoft,
    color: AppColors.kRatingItemColor
  );

  static const kWhite30TextStyle = TextStyle(
    fontSize: 16.0,
    fontFamily:  AppFonts.kProximasoft,
    color: Colors.white30,
  );

}