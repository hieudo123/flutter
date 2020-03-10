import 'package:bmi_calculator/commons/app_colors.dart';
import 'package:bmi_calculator/commons/app_constants.dart';
import 'package:flutter/material.dart';

class MyIconContentWidget extends StatelessWidget {
  final IconData mIcon;
  final String title;

  const MyIconContentWidget({
    Key key, this.mIcon, this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          mIcon,
          size: 80.0,
          color: AppColors.kWhiteColor,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: AppConstants.kLabelStyle,
        )
      ],
    );
  }
}